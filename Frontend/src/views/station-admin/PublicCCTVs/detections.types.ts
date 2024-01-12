export interface ReceivedMessageData {
  frame: string; // Base64 encoded frame
  detections: {
    objects: ObjectDetection[];
    weapon: WeaponDetection[];
    fight: FightClassification;
    climber: ClimberClassification;
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
export interface Classification {
  predicted_class: number;
  prediction_confidence: number;
  prediction_label: string;
}
export interface FightClassification extends Classification {
  prediction_label: "fight" | "no-fight";
}
export interface ClimberClassification extends Classification {
  prediction_label: "climber" | "no-climber";
}
