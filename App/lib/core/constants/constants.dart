import 'package:rakshak/data/models/home/post_incident_resp.dart';

List<Incident> userReports = [
  Incident(
    id: "ABCD1234",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentA0",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    type: "Crime",
    stationName: "Andheri",
    location: "Chakala street",
    source: "User Report",
    status: "Closed",
    createdAt: "2023-12-27T00:21:12.102+00:00",
  ),
  Incident(
    id: "EFGH5678",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentB1",
    description: "Incident1",
    type: "Robbery",
    stationName: "Colaba",
    location: "Gateway of India",
    source: "User Report",
    status: "Pending",
    createdAt: "2023-12-28T08:45:30.512+00:00",
  ),
  Incident(
    id: "IJKL9012",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentC2",
    description: "Incident2",
    type: "Assault",
    stationName: "Bandra",
    location: "Linking Road",
    source: "User Report",
    status: "Resolved",
    createdAt: "2023-12-29T14:10:05.721+00:00",
  ),
];
