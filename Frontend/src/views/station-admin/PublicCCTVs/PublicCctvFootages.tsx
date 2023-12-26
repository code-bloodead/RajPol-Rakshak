import { CctvDetails } from "./cctvs.types";

import Card from "@/components/card";
import ReactApexChart from "react-apexcharts";
import { useState } from "react";
import { MdOutlineConnectedTv, MdOutlinePostAdd } from "react-icons/md";
import VideoPlayer from "../Footages/Stream/VideoPlayer";

enum Tab {
  Footage = "Footage",
  Statistics = "Statistics",
}

interface PublicCctvFootagesProps {
  cctvs: CctvDetails[];
  onToggleMapDrawer: () => void;
}

const PublicCctvFootages = (props: PublicCctvFootagesProps) => {
  const { cctvs, onToggleMapDrawer } = props;
  const [activeTab, setActiveTab] = useState<Tab>(Tab.Footage);

  return (
    <div>
      <div className="text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700">
        <div className="flex justify-between">
          <div className="">
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
          <div className="flex flex-wrap justify-items-end mx-3">
            <button
              onClick={onToggleMapDrawer}
              className={` flex items-center justify-center rounded-lg bg-lightPrimary p-[0.4rem]  font-medium text-brand-500 transition duration-200 hover:cursor-pointer hover:bg-gray-100 dark:bg-navy-700 dark:text-white dark:hover:bg-white/20 dark:active:bg-white/10 ml-auto me-2 text-sm`}
            >
              <span> Add footage </span>
              <MdOutlineConnectedTv className="ml-1 h-4 w-4" />
            </button>
          </div>
        </div>
      </div>

      <>
        <div
          className="mx-3 mt-3 grid grid-cols-1 gap-5 md:grid-cols-2"
          style={{
            display: activeTab === Tab.Footage ? "grid" : "none",
          }}
        >
          {cctvs.map((cctv) => (
            <Card extra="min-h-[40vh] ">
              <div className="flex items-center justify-start">
                <h1 className="ml-3 mt-3 text-xl font-bold text-navy-700 dark:text-white">
                  {cctv.name}
                </h1>
                <div className="grow"></div>
              </div>
              <div className="p-2 flex flex-row items-center justify-between">
                <span className="mx-2">{cctv.description}</span>
                {/* <span className="mr-2 rounded px-2.5 py-0.5 text-xs font-medium bg-red-100 border border-red-400 text-red-700">
                  Overcrowded
                </span> */}
                <button
                  onClick={() => {}}
                  className={` flex items-center justify-center rounded-lg bg-lightPrimary p-[0.4rem]  font-medium text-brand-500 transition duration-200 hover:cursor-pointer hover:bg-gray-100 dark:bg-navy-700 dark:text-white dark:hover:bg-white/20 dark:active:bg-white/10 ml-auto me-2 text-sm`}
                >
                  <span> Create Task </span>
                  <MdOutlinePostAdd className="ml-1 h-4 w-4" />
                </button>
              </div>
              <div className=" p-2 mt-1">
                <VideoPlayer url={cctv.streamUrl} />
              </div>
              {/* <CrowdAlert alertLevel={platformWiseCrowd[idx].alert} /> */}
            </Card>
          ))}
        </div>
      </>

      <>
        <div
          className="p-2 mx-3 mt-3 grid grid-cols-1 gap-5 md:grid-cols-2"
          style={{
            visibility: activeTab === Tab.Statistics ? "visible" : "hidden",
            display: activeTab === Tab.Statistics ? "grid" : "none",
          }}
        >
          <Card extra="min-h-[40vh]">
            <div className="p-3">
              <ReactApexChart
                options={{
                  chart: {
                    id: "platform-wise-data-pie",
                    type: "pie",
                    height: 350,
                  },
                  title: {
                    text: "Live Crowd distribution",
                    align: "left",
                  },
                  labels: [],
                }}
                series={[]}
                type="pie"
                width={380}
              />
              <br />
              <ReactApexChart
                options={{
                  chart: {
                    id: "platform-wise-data-pie",
                    type: "pie",
                    height: 500,
                  },
                  title: {
                    text: "Overall Crowd distribution",
                    align: "left",
                  },
                  labels: [],
                }}
                series={[]}
                type="pie"
                width={380}
              />
            </div>
          </Card>
          <Card>
            <div className="p-3">
              <ReactApexChart
                series={[]}
                options={{
                  chart: {
                    height: 900,
                    width: 1000,
                    type: "area",
                    // stacked: true,
                    zoom: {
                      enabled: true,
                      type: "x",
                      autoScaleYaxis: false,
                      zoomedArea: {
                        fill: {
                          color: "#90CAF9",
                          opacity: 0.4,
                        },
                        stroke: {
                          color: "#0D47A1",
                          opacity: 0.4,
                          width: 1,
                        },
                      },
                    },
                  },
                  xaxis: {
                    range: 7,
                    labels: {
                      show: false,
                    },
                  },
                  dataLabels: {
                    enabled: false,
                  },
                  tooltip: {
                    style: {
                      fontSize: "10px",
                    },
                  },
                  stroke: {
                    curve: "smooth",
                  },
                }}
                type="area"
              />
            </div>
          </Card>
        </div>
      </>
    </div>
  );
};

export default PublicCctvFootages;
