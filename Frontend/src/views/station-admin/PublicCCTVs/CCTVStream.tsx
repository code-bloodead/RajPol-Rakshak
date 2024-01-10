import React, { useEffect, useRef, useState } from "react";
import useWebSocket, { ReadyState } from "react-use-websocket";
import {
  drawImageOnCanvas,
  drawRect,
  getHighDpiCanvasContext,
} from "../../../utils/canvas";
import { CctvDetails } from "./cctvs.types";
import {
  getClimberColor,
  getColor,
  getWeaponColor,
} from "../../../utils/pallete";
import Card from "@/components/card";
import {
  bboxCoordsToCanvasCoords,
  filterDetections,
} from "../../../utils/yolo";
import { countLabels } from "../../../utils/labels";
import {
  ClimberDetection,
  FightDetection,
  ObjectDetection,
  ReceivedMessageData,
  WeaponDetection,
} from "./detections.types";
import { VIDEO_STREAM_SERVER } from "../../../constants/config";

interface CCTVStreamProps {
  cctv: CctvDetails;
}


const CCTVStream: React.FC<CCTVStreamProps> = ({ cctv }) => {
  const [currentObjectDetections, setCurrentObjectDetections] = useState<
    ObjectDetection[]
  >([]);
  const [currentWeaponDetections, setCurrentWeaponDetection] = useState<
    WeaponDetection[]
  >([]);
  const [currentClimberDetections, setCurrentClimberDetection] = useState<
    ClimberDetection[]
  >([]);
  const [currentFightDetection, setCurrentFightDetection] =
    useState<FightDetection | null>(null);

  const [currentFrameData, setCurrentFrameData] = useState<string | null>(null);
  const canvasRef = useRef<HTMLCanvasElement | null>(null);
  const voidFrameCountRef = useRef<number>(0);
  // const videoRef = useRef<HTMLVideoElement | null>(null);

  const { lastJsonMessage, readyState } = useWebSocket<ReceivedMessageData>(
    `${VIDEO_STREAM_SERVER}/ws?stream_url=${cctv.streamUrl}`,
    {
      onOpen: () => console.log("connected socket for stream", cctv.streamUrl),
      // onMessage: (msg) => console.log("message received for stream", cctv.streamUrl, msg),
      onClose: () =>
        console.log("disconnected socket for stream", cctv.streamUrl),
    }
  );

  useEffect(() => {
    const canvas = canvasRef.current;
    const ctx = canvas ? getHighDpiCanvasContext(canvas) : null;
    const newFrame: string | null = lastJsonMessage?.frame;

    if (ctx && newFrame) {
      voidFrameCountRef.current += 1;
      setCurrentFrameData(newFrame);

      const receivedObjectDetections = filterDetections(
        lastJsonMessage.detections?.objects || [],
        0.5,
        ["person"]
      );
      const receivedWeaponDetections = filterDetections(
        lastJsonMessage.detections?.weapon || [],
        0.5,
      );
      const receivedClimberDetection = filterDetections(
        lastJsonMessage.detections?.climber || [],
        0.3,
        ["walker"]
      );
      const receivedFightDetection = lastJsonMessage.detections?.fight;
      setCurrentObjectDetections(receivedObjectDetections);
      setCurrentWeaponDetection(receivedWeaponDetections);
      setCurrentClimberDetection(receivedClimberDetection);
      setCurrentFightDetection(receivedFightDetection);

      // console.log("Received", {
      //   receivedObjectDetections,
      //   receivedWeaponDetections,
      //   receivedFightDetection,
      // });

      // Don't Clear the canvas !!

      // Draw the image on the canvas
      drawImageOnCanvas(ctx, "data:image/jpeg;base64," + newFrame).then(() => {
        const LabelFontSize = 18 * window.devicePixelRatio;
        const LabelFont = `${LabelFontSize}px Arial`;

        receivedClimberDetection.forEach((climberDetection) => {
          const climberColor = getClimberColor(climberDetection.label);
          const { x, y, width, height } = bboxCoordsToCanvasCoords(
            canvas,
            climberDetection.bbox
          );

          drawRect(ctx, x, y, width, height, {
            lineWidth: 2,
            strokeStyle: climberColor,
            label: {
              text: `${
                climberDetection.label
              } ${climberDetection.confidence.toFixed(2)}`,
              xOffset: 0,
              yOffset: -5,
              font: LabelFont,
              backgroundColor: climberColor,
            },
          });
        });

        receivedWeaponDetections.forEach((weaponDetection) => {
          const weaponColor = getWeaponColor(weaponDetection.label);
          const { x, y, width, height } = bboxCoordsToCanvasCoords(
            canvas,
            weaponDetection.bbox
          );

          drawRect(ctx, x, y, width, height, {
            lineWidth: 2,
            strokeStyle: weaponColor,
            label: {
              text: `${
                weaponDetection.label
              } ${weaponDetection.confidence.toFixed(2)}`,
              xOffset: 0,
              yOffset: -5,
              font: LabelFont,
              backgroundColor: weaponColor,
            },
          });
        });

        receivedObjectDetections.forEach((objectDetection, idx) => {
          const objColor = getColor(idx);
          const { x, y, width, height } = bboxCoordsToCanvasCoords(
            canvas,
            objectDetection.bbox
          );

          drawRect(ctx, x, y, width, height, {
            lineWidth: 2,
            strokeStyle: objColor,
            label: {
              text: `${
                objectDetection.label
              } ${objectDetection.confidence.toFixed(2)}`,
              xOffset: 0,
              yOffset: -4,
              font: LabelFont,
              backgroundColor: objColor,
            },
          });
        });
      });
    }
  }, [lastJsonMessage]);

  const showFeed = readyState === ReadyState.OPEN && currentFrameData !== null;

  return (
    <Card extra="min-h-[40vh] " key={cctv.id}>
      <div className="flex items-center justify-start">
        <h1 className="ml-3 mt-3 text-xl font-bold text-navy-700 dark:text-white">
          {cctv.name}
        </h1>
        <div className="grow"></div>
      </div>
      <div className="p-2 flex flex-row items-center justify-between">
        <span className="mx-2">{cctv.description}</span>
        {currentFightDetection && (
          <span
            className={
              "mr-2 rounded px-2.5 py-0.5 text-xs font-medium " +
              (currentFightDetection.predicted_class == 1
                ? "bg-red-100 border border-red-400 text-red-700"
                : "bg-green-100 border border-green-400 text-green-700")
            }
          >
            {currentFightDetection.predicted_class === 1
              ? "Fight detected"
              : "No fight"}
            {/* ({currentFightDetection.prediction_confidence}%) */}
          </span>
        )}
        {/* <button
        onClick={() => {}}
        className={` flex items-center justify-center rounded-lg bg-lightPrimary p-[0.4rem]  font-medium text-brand-500 transition duration-200 hover:cursor-pointer hover:bg-gray-100 dark:bg-navy-700 dark:text-white dark:hover:bg-white/20 dark:active:bg-white/10 ml-auto me-2 text-sm`}
      >
        <span> Create Task </span>
        <MdOutlinePostAdd className="ml-1 h-4 w-4" />
      </button> */}
      </div>
      <div>
        <canvas
          ref={canvasRef}
          className="w-full"
          // style={{ aspectRatio: 1.7 }}
          style={{ aspectRatio: 1.7, display: showFeed ? "block" : "none" }}
        />
        {readyState === ReadyState.CONNECTING ||
        (readyState === ReadyState.OPEN && currentFrameData === null) ||
        !currentFrameData?.length ? (
          <div className="w-full d-flex align-items-center justify-center h-10 min-h-fit">
            <button
              disabled
              type="button"
              className="flex py-2.5 px-5 mx-auto my-20 text-sm font-medium text-gray-900 bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700 items-center"
            >
              <svg
                aria-hidden="true"
                role="status"
                className="inline w-4 h-4 me-3 text-gray-200 animate-spin dark:text-gray-600"
                viewBox="0 0 100 101"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
                  fill="currentColor"
                />
                <path
                  d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
                  fill="#1C64F2"
                />
              </svg>
              Loading...
            </button>
          </div>
        ) : readyState === ReadyState.CLOSED ? (
          <div> Closed !</div>
        ) : (
          <></>
        )}
        {currentFrameData && currentFrameData && (
          <>
            {/* <img
            src={"data:image/jpeg;base64, " + currentFrameData}
            alt="CCTV Frame"
          /> */}
          </>
        )}
        {/* <video ref={videoRef} controls className="w-full" /> */}
        {currentWeaponDetections.length > 0 && (
          <h2>
            Detected weapons:{" "}
            {countLabels(currentWeaponDetections.map((d) => d.label))
              .map(
                ([label, count]) => `${count} ${label}${count > 1 ? "s" : ""}`
              )
              .join(", ")}
          </h2>
        )}
        {currentObjectDetections.length > 0 && (
          <h2>
            Detected objects:{" "}
            {countLabels(currentObjectDetections.map((d) => d.label))
              .map(
                ([label, count]) => `${count} ${label}${count > 1 ? "s" : ""}`
              )
              .join(", ")}
          </h2>
        )}
        {currentObjectDetections.length > 0 && (
          <h2>
            Detected poses:{" "}
            {countLabels(currentClimberDetections.map((d) => d.label))
              .map(
                ([label, count]) => `${count} ${label}${count > 1 ? "s" : ""}`
              )
              .join(", ")}
          </h2>
        )}
      </div>
      {/* <div className=" p-2 mt-1">
      <VideoPlayer url={cctv.streamUrl} />
    </div> */}
      {/* <CrowdAlert alertLevel={platformWiseCrowd[idx].alert} /> */}
    </Card>
  );
};

export default CCTVStream;
