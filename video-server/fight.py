import cv2
from keras.models import load_model
import numpy as np

fightModel = load_model("weights/fights/fights2vgg2cat2.keras")
print("Fight model loaded")

FIGHT_FRAME_WIDTH = 128
FIGHT_FRAME_HEIGHT = 128
FIGHT_NUM_FRAMES = 30  # Number of frames per video clip (must match the training configuration)
frame_buffer = []
def reset_buffer():
    global frame_buffer
    frame_buffer = []

FIGHT_PREDICTION_CLASSES = {
    0: 'no-fight',
    1: 'fight'
}

dummy_called = 0
def detect_fight_dummy(frame):
    dummy_called += 1
    if dummy_called == FIGHT_NUM_FRAMES:
        predictions = [[0.9999999, 0.0000001]]
        return {
            'prediction_confidence': predictions[0][0],
            'predicted_class': 0,
            'prediction_label': 'fight'
        }
    return None

fight_detection = None
def detect_fight(frame):
    global fight_detection
    global frame_buffer

    standardizedFrame = cv2.resize(frame, (FIGHT_FRAME_WIDTH, FIGHT_FRAME_HEIGHT))
    frame_buffer.append(standardizedFrame)
    
    # Limit to FIGHT_NUM_FRAMES frames
    if len(frame_buffer) > FIGHT_NUM_FRAMES:
        frame_buffer = frame_buffer[-7:]

    # print("Buffer size", len(frame_buffer))

    if len(frame_buffer) == FIGHT_NUM_FRAMES:
        input_video_clip = np.array(frame_buffer)
        input_video_clip = np.expand_dims(input_video_clip, axis=0)

        # Perform predictions
        prediction = fightModel.predict(input_video_clip)

        # Get the class with the highest probability as the predicted class
        predicted_class = np.argmax(prediction, axis=1)

        print("Performed Fight detection: ", prediction)

        fight_detection = {
            'predicted_class':  int(predicted_class[0]),
            'prediction_confidence': float(prediction[0][predicted_class[0]]),
            'prediction_label': FIGHT_PREDICTION_CLASSES[predicted_class[0]],
        }
        # print("Performed fight detection:", fight_detection)
        reset_buffer()
    else:
        # print("Pass ...")
        pass

    return fight_detection


# assault_last_time = 0
# cap = cv2.VideoCapture('rtmp://localhost/mystream')
# counter = 0
# while True:

#     ret, frame = cap.read()
#     if not ret:
#         break

#     if (time.time()-assault_last_time) > 600:
#         standardizedFrame = cv2.resize(frame, (FIGHT_FRAME_WIDTH, FIGHT_FRAME_HEIGHT))

#         frame_buffer.append(standardizedFrame)

#         if len(frame_buffer) > FIGHT_NUM_FRAMES:
#             frame_buffer.pop(0)

#         if counter % 150 == 0:
#         # Perform prediction when the buffer is full
#             if len(frame_buffer) == FIGHT_NUM_FRAMES:
#                 input_video_clip = np.array(frame_buffer)
#                 input_video_clip = np.expand_dims(input_video_clip, axis=0)

#                 # Perform prediction
#                 predictions = fightModel.predict(input_video_clip)

#                 # Get the class with the highest probability as the predicted class
#                 predicted_class = np.argmax(predictions, axis=1)

#                 # Display the result on the frame
#                 print(f"Predicted Class: {predicted_class[0]}")
#                 if predicted_class[0] == 1:
#                     N = 8
#                     cv2.imwrite('/home/azureuser/sih/garbage/results/test.jpg', frame)
#                     id = ''.join(random.choices(string.ascii_uppercase +
#                                             string.digits, k=N))
#                     path = "/home/azureuser/sih/garbage/results/test.jpg"
#                     # folderpath = results[0].save_dir + '/'

#                     key_name = f'{id}.jpg'
#                     bucket.upload_file(path, key_name)
#                     to_insert = {
#                     'id':id,
#                     'image':f'https://railrakshak.s3.amazonaws.com/{key_name}',
#                     'title':"Violence Detected",
#                     'description':"Violence Detected via CCTV",
#                     'type':"Anomaly",
#                     'station_name':"Andheri",
#                     'location':"Platform 5",
#                     'source':"CCTV",
#                     'status':"Pending",
#                     'created_at': datetime.now(),

#                 }
#                     incidents.insert_one(to_insert)

#                     assault_last_time = time.time()
#     counter +=1
# cap.release()
