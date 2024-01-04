def parse_yolo_predictions(predictions):
    if predictions is None or len(predictions) == 0:
        return []

    results = []
    for i in range(len(predictions[0].boxes)):
        results.append({
            'confidence': predictions[0].boxes[i].conf[0].item(),
            'label': predictions[0].names[predictions[0].boxes[i].cls.item()],
            'bbox': predictions[0].boxes[i].xywhn[0].tolist(),
            'bbox_std': predictions[0].boxes[i].xywh[0].tolist(),
            'orig_shape': predictions[0].orig_shape
        })
    return results
