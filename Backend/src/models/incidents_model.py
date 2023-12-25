from pydantic import BaseModel
from fastapi import Form
import datetime

class Incidents(BaseModel):
    id: str = Form(default="")
    image: str = Form(default="")
    title: str = Form(default="")
    description: str = Form(default="")
    type: str = Form(...)
    # types are: Crime, Violence, Stampede, Safety Threat, Cleanliness, Others
    station_name: str = Form(...)
    location: str = Form(...)
    source: str = Form(default="CCTV")
    # sources are: CCTV, User
    status: str = Form(default="Pending")
    #status are: Pending, Resolved, Rejected
    created_at: str = Form(default=datetime.datetime.now())