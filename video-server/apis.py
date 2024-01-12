import json
import threading
import time
import requests
SERVER_URL = "https://rajpol-backend-staging.onrender.com"


def create_incident(incident):

    # Create a new dictionary with selective keys
    selected_fields = ['image', 'title', 'description', 'type', 'station_name', 'source', 'location', 'status']
    incident = {key: incident[key]
                for key in selected_fields if key in incident}
    
    request_name = "Create incident"
    response = requests.post(f"{SERVER_URL}/incidents/create_incident",
                             json.dumps(incident), headers={"Content-Type": "application/json"})

    # Create a new dictionary with selective keys

    # Check the response
    if response.status_code == 200:
        print(f"{request_name} request ({incident['type']}) was successful !")
    else:
        print(f"{request_name} request ({incident['type']}) failed with status code {response.status_code}")
        print("Error message:", response.text)
        print("For", incident)
