class ModelLogin {
  String? status;
  UserData? userData;
  String? message;

  ModelLogin({this.status, this.userData, this.message});

  ModelLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? deviceId;
  String? slug;
  String? regtime;
  String? address;
  String? landmark;
  int? otp;
  String? token;

  UserData(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.deviceId,
        this.slug,
        this.regtime,
        this.address,
        this.landmark,
        this.otp,
        this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    deviceId = json['device_id'];
    slug = json['slug'];
    regtime = json['regtime'];
    address = json['address'];
    landmark = json['landmark'];
    otp = json['otp'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['device_id'] = this.deviceId;
    data['slug'] = this.slug;
    data['regtime'] = this.regtime;
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['otp'] = this.otp;
    data['token'] = this.token;
    return data;
  }
}
