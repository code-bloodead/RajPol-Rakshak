class PostPoliceLoginReq {
  String? id;
  String? password;
  String? notification_token;

  PostPoliceLoginReq({this.id, this.password, this.notification_token});

  PostPoliceLoginReq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    notification_token = "unnecessary";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.password != null) {
      data['password'] = this.password;
    }
    if (this.password != null) {
      data['password'] = this.password;
    }
    data['notification_token'] = "unnecessary";
    return data;
  }
}
