import { ReadyState } from "react-use-websocket";

export interface CctvDetails {
  id: string;
  cctv_type: string;
  name: string;
  description: string;
  latitude: number;
  longitude: number;
  streamUrl: string;
}

export const ReadyStateMap: Record<ReadyState, string> = {
  [ReadyState.UNINSTANTIATED]: "Not instantiated",
  [ReadyState.CONNECTING]: "Connecting ...",
  [ReadyState.OPEN]: "Open ...",
  [ReadyState.CLOSING]: "Closing ...",
  [ReadyState.CLOSED]: "Closed !",
};

