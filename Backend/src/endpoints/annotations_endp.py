from fastapi import APIRouter
from fastapi import UploadFile, Form
from src.config import AWS_KEY, SECRET_KEY_AWS, S3_BUCKET_NAME
import boto3
import random
import cv2
import numpy as np
import io
import json
import pprint
s3 = boto3.resource(
    service_name='s3',
    aws_access_key_id=f"{AWS_KEY}",
    aws_secret_access_key=f"{SECRET_KEY_AWS}"
)
bucket = s3.Bucket(S3_BUCKET_NAME)

router = APIRouter(
    prefix="/anotations",
    tags=["Anotations"],
    responses={404: {"description": "Not found"}},
)


def getNumberOfObjectsInBucket(bucketName, prefix):
    count = 0
    response = boto3.client('s3').list_objects_v2(Bucket=bucketName,Prefix=prefix)
    for object in response['Contents']:
        if object['Size'] != 0:
            #print(object['Key'])
            count+=1
    return count

# function that generates random id of length 8
def generateID():
    id = ""
    for i in range(8):
        if random.random() < 0.5:
            id += chr(random.randint(65,90))
        else:
            id += str(random.randint(0,9))
    return id

@router.post("/create_anotation")
async def create_incident_by_user(image: UploadFile, json_data: str = Form(...)):
    try:
        filename = image.filename.replace(" ","")
        img_extension = filename.split(".")[1]
            
        if img_extension not in ["png", "jpg","jpeg"]:
            return {"ERROR":"INVALID IMAGE FORMAT"}

        # Create a BytesIO object from the uploaded file
        byte_im = await image.read()

        byte_im_io = io.BytesIO(byte_im)

        data = json.loads(json_data)

        selected_options = [option['value'] for option in data['annotations']['selected_options']]
        name =  str(filename.split(".")[0] + generateID())
        counter = 0
        yaml = """
        train: ../train/images
        val: ../valid/images
        test: ../test/images

        nc: 1

        names: ['0']
        """
        for option in selected_options:
            ### Get the number of files in option/train
            ### Get the number of files in option/valid
            ### Get the number of files in option/test
            ntrain = getNumberOfObjectsInBucket(S3_BUCKET_NAME, f"{option}/train/")
            nvalid = getNumberOfObjectsInBucket(S3_BUCKET_NAME, f"{option}/valid/")
            ntest = getNumberOfObjectsInBucket(S3_BUCKET_NAME, f"{option}/test/")
            total = ntrain + nvalid + ntest

            w = float(data['annotations'][counter]['width'])
            h = float(data['annotations'][counter]['height'])
            x = float(data['annotations'][counter]['x']) + w/2
            y = float(data['annotations'][counter]['y']) + h/2
            label = f"0 {x} {y} {w} {h}\n"

            if ntrain == 0:
                bucket.upload_fileobj(byte_im_io, f"{option}/train/images/{name}.jpg")
                s3.Object(S3_BUCKET_NAME, f"{option}/train/labels/{name}.txt").put(Body=label)
                s3.Object(S3_BUCKET_NAME, f"{option}/data.yaml").put(Body=yaml)
            if (ntrain)/total*100 < 60:
                bucket.upload_fileobj(byte_im_io, f"{option}/train/images/{name}.jpg")
                s3.Object(S3_BUCKET_NAME, f"{option}/train/labels/{name}.txt").put(Body=label)
            elif (nvalid)/total*100 < 20:
                bucket.upload_fileobj(byte_im_io, f"{option}/valid/images/{name}.jpg")
                s3.Object(S3_BUCKET_NAME, f"{option}/valid/labels/{name}.txt").put(Body=label)
            else:
                bucket.upload_fileobj(byte_im_io, f"{option}/test/images/{name}.jpg")
                s3.Object(S3_BUCKET_NAME, f"{option}/test/labels/{name}.txt").put(Body=label)


        # pprint.pprint(data)
        # uname = str(filename.split(".")[0] + generateID() + ".jpg")
        # bucket.upload_fileobj(byte_im_io, uname)
        # url = f"https://{S3_BUCKET_NAME}.s3.amazonaws.com/{uname}"
    
        # return {"url":url}
        return {"SUCCESS":"IMAGE UPLOADED"}
    except Exception as e:
        print(e)
        return {"ERROR":"SOME ERROR OCCURRED"}

