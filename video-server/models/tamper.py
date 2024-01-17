import numpy as np
import cv2
import matplotlib.pyplot as plt
from config import MIN_TAMPER_CONF

fgbg = cv2.createBackgroundSubtractorMOG2()
kernel = np.ones((5, 5), np.uint8)

def detect_temper_dummy(frame):
    return {'tamper': True}

def detect_tamper(frame):
    if (frame is None):
        return {'tamper': False}
    
    # Convert the frame to grayscale
    gray_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Apply erosion and dilation
    kernel = np.ones((5, 5), np.uint8)
    erosion = cv2.erode(gray_frame, kernel, iterations=1)
    dilation = cv2.dilate(erosion, kernel, iterations=1)

    # Calculate absolute difference between original and processed frames
    diff = cv2.absdiff(gray_frame, dilation)

    # Set a threshold for the difference
    threshold = 30
    _, threshold_diff = cv2.threshold(diff, threshold, 255, cv2.THRESH_BINARY)

    # Count non-zero pixels in the thresholded difference
    tamper_pixels = np.count_nonzero(threshold_diff)

    # Set a threshold for tamper detection
    tamper_threshold = 0.01 * frame.size

    # Return True if tampering is detected, False otherwise
    return { 'tamper': tamper_pixels > tamper_threshold }

    # # a = 0
    # # bounding_rect = []
    # fgmask = fgbg.apply(frame)
    # fgmask = cv2.erode(fgmask, kernel, iterations=5)
    # fgmask = cv2.dilate(fgmask, kernel, iterations=5)
    # # cv2.imshow('frame', frame)

    # contours, _ = cv2.findContours(
    #     fgmask, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    # # # for i in range(0, len(contours)):
    # # #     bounding_rect.append(cv2.boundingRect(contours[i]))
    # print("Obstacles", len(contours))
    # # for i in range(0, len(contours)):
    # #     # if bounding_rect[i][2] >= 40 or bounding_rect[i][3] >= 40:
    # #     #     a = a+(bounding_rect[i][2])*bounding_rect[i][3]
    # #     if (a >= int(frame.shape[0])*int(frame.shape[1])/3):
    # #         return { 'tamper': True }

    # return {'tamper': False}
