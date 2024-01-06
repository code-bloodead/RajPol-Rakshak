class PostIncidentResp {
  List<Incident>? dataList;

  PostIncidentResp({this.dataList});

  PostIncidentResp.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataList = List<Incident>.from(
        (json['data'] as List).map(
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
  String? stationName;
  String? location;
  String? source;
  String? status;
  String? createdAt;

  Incident({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.type,
    required this.stationName,
    required this.location,
    required this.source,
    required this.status,
    required this.createdAt,
  });

  Incident.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    stationName = json['station_name'];
    location = json['location'];
    source = json['source'];
    status = json['status'];
    createdAt = json['created_at'];
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
    if (this.stationName != null) {
      data['station_name'] = this.stationName;
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
    if (this.createdAt != null) {
      data['created_at'] = this.createdAt;
    }
    return data;
  }
}
