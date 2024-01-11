from decouple import config

USERNAME = config("USER")
PASSWORD = config("PASSWORD")
DB_URL = config("DB_URL")
SMS_WEBHOOK = "https://www.fast2sms.com/dev/bulkV2"
API_KEY = config("API_KEY")
AWS_KEY = config("AWS_KEY")
SECRET_KEY_AWS = config("SECRET_KEY_AWS")
S3_BUCKET_NAME = "railrakshak"

# When video stream fails, or some error occurs, the video stream processing is stopped
MAX_CONSECUTIVE_FRAME_FAILURES = 20

DETECT_EVERY_N_FRAME = 40
LSTM_FRAME_REGISTER_EVERY_N_FRAME = 2
PREVENT_FRAME_OVERFLOW = 1200

# Whether to register incident in the database & at what speed
# Toggle this to prevent unnecessary incidents from being registered during development
REGISTER_INCIDENT = False
THROTTLE_INCIDENT_REPORT_TIME = 120  # 10 seconds
