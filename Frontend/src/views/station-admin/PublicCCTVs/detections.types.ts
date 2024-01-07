export interface ReceivedMessageData {
  frame: string; // Base64 encoded frame
  detections: {
    objects: ObjectDetection[];
    weapon: WeaponDetection[];
    climber: ClimberDetection[];
    fight: FightDetection;
  };
}

export interface ObjectDetection {
  label: string;
  confidence: number;
  bbox: number[];
  bbox_std: number[];
  orig_shape: number[];
}
export interface WeaponDetection extends ObjectDetection {
  label: "gun" | "knife";
}
export interface ClimberDetection extends ObjectDetection {
  label: "climber" | "walker";
}

export interface FightDetection {
  predicted_class: number;
  prediction_confidence: number;
  prediction_label: string;
}
