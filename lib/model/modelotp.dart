class ModelOtp {
  String? message;
  String? mobile;
  String? name;
  String? deviceId;
  String? token;
  int? id;
  int? stat;

  ModelOtp(
      {this.message,
        this.mobile,
        this.name,
        this.deviceId,
        this.token,
        this.id,
        this.stat});

  ModelOtp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    mobile = json['mobile'];
    name = json['name'];
    deviceId = json['device_id'];
    token = json['token'];
    id = json['id'];
    stat = json['stat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['device_id'] = this.deviceId;
    data['token'] = this.token;
    data['id'] = this.id;
    data['stat'] = this.stat;
    return data;
  }
}
