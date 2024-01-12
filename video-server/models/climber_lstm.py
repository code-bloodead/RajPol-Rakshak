import numpy as np
import cv2
from time import time

# Model spec
# number of frames passed to model for making single inference . this specification is as per the model used and should not be changed
NO_OF_FRAMES_FOR_INFERENCE = 16
valid_climber_classes = ['abseiling', 'rock climbing', 'ice climbing',
                         'cleaning windows', 'climbing a rope', 'climbing ladder', 'climbing tree']


climberResnetModel = cv2.dnn.readNet(
    "models/weights/climber_lstm/resnet-34_kinetics.onnx")
print("Climber LSTM model Loaded")

# loading class names
# original source - https://github.com/kenshohara/video-classification-3d-cnn-pytorch/blob/master/class_names_list
filepath_class_names = 'models/weights/climber_lstm/class_names_list.txt'
with open(filepath_class_names, 'r') as fh:
    class_names = fh.read().strip().split('\n')
print(f"Climber class has {len(class_names)} classes")


def preprocess(frames):
    model_img_w = 112    # as per model input image width
    model_img_h = 112    # as per model input image height
    # as per pre-trained model's mean values for normalization
    mean = (114.7748, 107.7354, 99.4750)
    # blob.shape is N x 3 x H x W ( samples, channels(RGB), width , height)
    blob = cv2.dnn.blobFromImages(frames, scalefactor=1, size=(
        model_img_w, model_img_h), mean=mean, swapRB=True, crop=True)
    blob = np.transpose(blob, (1, 0, 2, 3))  # resulting shape is 3 x N x H x W
    # resulting shape is 1 x 3 x N x H x W # 1 is for the batch dimension, required for input to the model
    blob = np.expand_dims(blob, axis=0)
    return blob


def get_generic_prediction(pred_class: int, pred):
    discrete_class = class_names[pred_class]
    confidence = float(pred[0][pred_class]),
    if discrete_class in valid_climber_classes:
        return 1, "climber", confidence
    else:
        return 0, "no-climber", confidence


frame_buffer = []


def reset_buffer():
    global frame_buffer
    frame_buffer = []


dummy_called = 0


def detect_climber_dummy(frame):
    global dummy_called
    dummy_called += 1
    if dummy_called == NO_OF_FRAMES_FOR_INFERENCE:
        predictions = [[0.9999999, 0.0000001]]
        return {
            'predicted_class': 0,
            'prediction_confidence': predictions[0][0],
            'prediction_label': 'abseiling'
        }
    return None


climber_classification = None


def detect_climber(frame):
    global climber_classification
    global frame_buffer

    frame_buffer.append(frame)

    # Limit to FIGHT_NUM_FRAMES frames
    if len(frame_buffer) > NO_OF_FRAMES_FOR_INFERENCE:
        frame_buffer = frame_buffer[-7:]

    # print("Buffer size", len(frame_buffer))

    if len(frame_buffer) == NO_OF_FRAMES_FOR_INFERENCE:
        frames_processed = preprocess(frame_buffer)
        climberResnetModel.setInput(frames_processed)
        pred = climberResnetModel.forward()  # resulting pred.shape will be (1 , 400)

        pred_class, pred_label, pred_conf = get_generic_prediction(np.argmax(pred), pred)

        climber_classification = {
            'predicted_class': pred_class,
            'prediction_confidence': pred_conf,
            'prediction_label': pred_label,
        }

        print("Performed climber classification: ", climber_classification)
        reset_buffer()
    else:
        # print("Pass ...")
        pass

    return climber_classification
