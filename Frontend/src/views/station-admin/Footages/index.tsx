import Card from "@/components/card";
import VideoPlayer from "./Stream/VideoPlayer";
import { useState } from "react";

enum Tab {
  Footage = "Footage",
  // Statistics = "Statistics",
}

const Footages = () => {
  const [activeTab, setActiveTab] = useState<Tab>(Tab.Footage);

  const streams = [
    {
      title: "Prison cell - 1A",
      // streamUrl: "http://localhost:8888/mystream/index.m3u8",  // Local stream
      streamUrl:
        "https://res.cloudinary.com/dp0ayty6p/video/upload/v1703653583/samples/prisonv105.mp4",
      socketUrl: "ws://localhost:5005/ws",
    },
    {
      title: "Prison cell - 3B",
      // streamUrl: "http://20.193.136.79/mystream/index.m3u8", // Azure URL
      streamUrl:
        "https://res.cloudinary.com/dp0ayty6p/video/upload/v1703653583/samples/prisonv105.mp4",
      socketUrl: "ws://localhost:5006/ws",
    },
    // {
    // title: "Prison cell - 5C",
    //   streamUrl: "http://localhost:8888/mystream/index.m3u8",
    //   socketUrl: "ws://localhost:5005/ws",
    // },
    // {
    // title: "Prison cell - 5D",
    //   streamUrl: "http://localhost:8888/mystream/index.m3u8",
    //   socketUrl: "ws://localhost:5005/ws",
    // },
  ];

  return (
    <div>
      <div className="text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700">
        <ul className="flex flex-wrap -mb-px">
          {Object.values(Tab).map((currentTab) => (
            <li className="mr-2">
              <a
                href="#"
                onClick={() => setActiveTab(currentTab)}
                className={`inline-block p-4 ${
                  activeTab == currentTab
                    ? "active text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500"
                    : "border-b-2 border-transparent rounded-t-lg text-gray-700 hover:text-gray-800 hover:border-gray-800 dark:hover:text-gray-800 "
                }`}
              >
                {currentTab}
              </a>
            </li>
          ))}
        </ul>
      </div>

      <>
        <div
          className="mx-3 mt-3 grid grid-cols-1 gap-5 md:grid-cols-2"
          style={{
            display: activeTab === Tab.Footage ? "grid" : "none",
          }}
        >
          {streams.map((stream) => (
            <Card extra="min-h-[40vh] ">
              <div className="flex items-center justify-start">
                <h1 className="ml-3 mt-3 text-xl font-bold text-navy-700 dark:text-white">
                  {stream.title}
                </h1>
                <div className="grow"></div>
                <div className="flex justify-end items-end mx-2 my-2 mt-4 me-4">
                  <div className=" whitespace-pre mr-2 rounded px-2.5 py-0.5 text-xs font-medium bg-red-100 border border-red-400 text-red-700">
                    Fight alert
                  </div>
                  <label htmlFor="underline_select" className="sr-only">
                    Select CCTV
                  </label>
                  <select
                    id="countries"
                    className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                  >
                    <option value="CCTV-1">CCTV-1</option>
                    <option value="CCTV-2">CCTV-2</option>
                    <option value="CCTV-3">CCTV-3</option>
                    <option value="CCTV-4">CCTV-4</option>
                  </select>
                </div>
              </div>
              <div className=" p-2 mt-1">
                <VideoPlayer url={stream.streamUrl} />
              </div>
              {/* <CrowdAlert alertLevel={platformWiseCrowd[idx].alert} /> */}
            </Card>
          ))}
        </div>
      </>
    </div>
  );
};

export default Footages;
