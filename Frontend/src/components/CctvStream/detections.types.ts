export interface ReceivedMessageData {
  frame: string; // Base64 encoded frame
  detections: {
    fight: FightClassification;
    anomalies: AnomalyClassification;
    objects: ObjectDetection[];
    weapons: WeaponDetection[];
    accidents: AccidentDetection[];
    fire: FireDetection[];
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
export interface FireDetection extends ObjectDetection {
  label: "fire";
}
export interface AccidentDetection extends ObjectDetection {
  label: "Accident";
}
export interface Classification {
  predicted_class: number;
  prediction_confidence: number;
  prediction_label: string;
}
export interface FightClassification extends Classification {
  prediction_label: "fight" | "no-fight";
}
export interface AnomalyClassification {
  climbing: boolean;
  violence: boolean;
  suspicious: boolean;
  prediction: {
    predicted_class: number;
    prediction_confidence: number;
    prediction_label: string;
  };
}
