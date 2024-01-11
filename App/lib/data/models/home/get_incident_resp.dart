class GetIncidentResp {
  List<Incident>? dataList;

  GetIncidentResp({this.dataList});

  GetIncidentResp.fromJson(List<dynamic> json) {
    if (json != []) {
      dataList = List<Incident>.from(
        json.map(
          (item) => Incident.fromJson(item),
        ),
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.dataList != null) {
      data['data'] = this.dataList!.map((item) => item.toJson()).toList();
    }
    return data;
  }
}

class Incident {
  String? id;
  String? image;
  String? title;
  String? description;
  String? type;
  String? station_name;
  String? location;
  String? source;
  String? status;
  String? created_at;

  Incident({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.type,
    required this.station_name,
    required this.location,
    required this.source,
    required this.status,
    required this.created_at,
  });

  Incident.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    station_name = json['station_name'];
    location = json['location'];
    source = json['source'];
    status = json['status'];
    created_at = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.image != null) {
      data['image'] = this.image;
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.description != null) {
      data['description'] = this.description;
    }
    if (this.type != null) {
      data['type'] = this.type;
    }
    if (this.station_name != null) {
      data['station_name'] = this.station_name;
    }
    if (this.location != null) {
      data['location'] = this.location;
    }
    if (this.source != null) {
      data['source'] = this.source;
    }
    if (this.status != null) {
      data['status'] = this.status;
    }
    if (this.created_at != null) {
      data['created_at'] = this.created_at;
    }
    return data;
  }
}
