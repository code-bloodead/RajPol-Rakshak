from src.models.admin_model import Admin
from src.database.auth_db import create_admin
from src.database.incident_db import create_incident
from src.models.incidents_model import Incidents

#### Creating 2 Station admins
PASSWORD = "123456aA"

admin1 = Admin(
    password=PASSWORD,
    station_name="Andheri",
    role="STATION_ADMIN",
    admin_name="Ravi"
)

admin2 = Admin(
    password=PASSWORD,
    station_name="Bandra",
    role="STATION_ADMIN",
    admin_name="kishore"
)

create_admin(admin1)
create_admin(admin2)

#### Creating 2 Dept admins for 2 different departments (Maintenance and Security) for each station

dept1 = Admin(
    password=PASSWORD,
    station_name="Andheri",
    role="DEPT_ADMIN",
    dept_name="Maintenance",
    admin_name="Sameer"
)

dept2 = Admin(
    password=PASSWORD,
    station_name="Andheri",
    role="DEPT_ADMIN",
    dept_name="Security",
    admin_name="Saurabh"
)

dept3 = Admin(
    password=PASSWORD,
    station_name="Bandra",
    role="DEPT_ADMIN",
    dept_name="Maintenance",
    admin_name="Rajesh"
)

dept4 = Admin(
    password=PASSWORD,
    station_name="Bandra",
    role="DEPT_ADMIN",
    dept_name="Security",
    admin_name="Brigesh"
)

create_admin(dept1)
create_admin(dept2)
create_admin(dept3)
create_admin(dept4)

#### Creating 10 incidents for each station

#crime, violence, stampede, cleanliness, safety threat
type = ["Crime","Violence","Stampede","Cleanliness","Safety Threat"]

for i in range(10):
    incident1 = Incidents(
        title="IncidentA"+str(i),
        description="Incident"+str(i),
        type=type[i%5],
        station_name="Andheri",
        location="Platform no. 1",
        source="CCTV"
    )
    incident2 = Incidents(
        title="IncidentB"+str(i),
        description="Incident"+str(i),
        type=type[i%5],
        station_name="Bandra",
        location="Platform no. 1",
        source="CCTV"
    )
    create_incident(incident1)
    create_incident(incident2)


