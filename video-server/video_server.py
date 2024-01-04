# main.py

import base64
import uvicorn
import cv2
from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.websockets import WebSocketState
from multiprocessing import Process, Queue, Event, Lock
import asyncio

app = FastAPI()

DETECT_EVERY_N_FRAME = 30
MAX_CONSECUTIVE_FRAME_FAILURES = 10

def is_websocket_alive(websocket: WebSocket):
    if websocket is None:
        return False
    return (websocket.client_state == WebSocketState.CONNECTED or websocket.client_state == WebSocketState.CONNECTING)

# Function to read video stream and perform detection
# Note, we can't pass websocket to this fn as its pickled & passed to a completely new process
def process_video_stream(url, output_queue: Queue, shutdown_event: Event):
    # Importing here, coz this fn will be run in a separate process
    from yolo_objects import detect_objects, detect_objects_dummy
    from fight import detect_fight, detect_fight_dummy
    from violence_objects import detect_weapons, detect_weapons_dummy

    cap = cv2.VideoCapture(url)

    consecutiveFrameFailures = 0
    framecount = 0

    detections = {
        'fight': None,
        'objects': None,
        'weapon': None,
    }

    try:
        while not shutdown_event.is_set():
            try:
                framecount += 1
                ret, frame = cap.read()
                if not ret:
                    break
                
                # Some Model need contiguous frames (TODO - control it using time.time())
                detections['fight'] = detect_fight(frame)
                # detections.fight = detect_fight_dummy(frame),

                # Frame-independent models
                if framecount % DETECT_EVERY_N_FRAME == 0:
                    # Single frame detection are updated every {DETECT_EVERY_N_FRAME} frames

                    detections['objects'] = detect_objects(frame)
                    # detections['objects'] = detect_objects_dummy(frame)
                    
                    detections['weapon'] = detect_weapons(frame)
                    # detections['weapon'] = detect_weapons_dummy(frame),
                
                    print("Send detections", detections)

                # Convert the original frame to JPEG format and encode it in Base64
                _, buffer = cv2.imencode('.jpg', frame)
                image_data_base64 = base64.b64encode(
                    buffer.tobytes()).decode('utf-8')

                output_queue.put(
                    {"frame": image_data_base64, "detections": detections})
                
            except Exception as e:
                print("Error", e)
                consecutiveFrameFailures += 1
                if consecutiveFrameFailures >= MAX_CONSECUTIVE_FRAME_FAILURES:
                    print("Max consecutive frame failures reached, exiting")
                    break
        print("Wrap up due to shutdown event")
    finally:
        cap.release()
        output_queue.put(-1)

# WebSocket endpoint to handle communication with the React client
@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket, stream_url: str):
    try:
        print("Wait for connection acceptance", stream_url)
        # Set your desired timeout value in seconds
        await asyncio.wait_for(websocket.accept(), timeout=10)
        print("Connection accepted for", stream_url)
    except asyncio.TimeoutError:
        print("Timeout waiting for connection acceptance")
        return
    except Exception as e:
        print("Error", e)
        return

    output_queue = Queue()
    shutdown_event = Event()

    async def shutdown():
        try:
            print("Shutdown event triggered")
            shutdown_event.set()
            await websocket.close()
        except:
            pass
        
    async def fastapi_app_shutdown():
        print("Fast API app shutdown event triggered")
        await shutdown()

    app.add_event_handler("shutdown", fastapi_app_shutdown)

    # Start the video processing in a separate process
    video_process = Process(target=process_video_stream, args=(
        stream_url, output_queue, shutdown_event))
    video_process.start()

    print(f"Started process {video_process._identity} for", stream_url)

    try:
        while is_websocket_alive(websocket) and not shutdown_event.is_set():
            # Get the latest frame and detections from the output queue
            result = output_queue.get()

            if result == -1:
                print("Received -1 from queue, exiting")
                break

            # Send message with detections to the client
            await websocket.send_json(result)

            # Introduce a small delay to control the frame rate
            await asyncio.sleep(0.01)
        print("Websocket is died")
    except WebSocketDisconnect:
        print("Client disconnected")
    except Exception as e:
        print("Error Managing socket", e)
        pass
    finally:
        print(f"Terminate process {video_process._identity} for", stream_url)
        await websocket.close()
        video_process.terminate()
        await shutdown()


# Run the FastAPI server
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=5005)
