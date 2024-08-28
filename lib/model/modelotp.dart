class ModelOtp {
  String? message;
  User? user;
  String? token;
  int? id;

  ModelOtp({this.message, this.user, this.token, this.id});

  ModelOtp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    data['id'] = this.id;
    return data;
  }
}

class User {
  int? id;
  Null? name;
  Null? email;
  String? mobile;
  Null? type;
  Null? tokenStatus;
  Null? customerId;
  Null? adminId;
  Null? emailVerifiedAt;
  Null? slug;
  Null? resetToken;
  String? createdAt;
  String? updatedAt;
  Null? regtime;
  String? deviceId;
  Null? otp;
  Null? otpExpiresAt;
  Null? address;
  Null? landmark;
  Null? cCode;
  Null? wpNum;

  User(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.type,
        this.tokenStatus,
        this.customerId,
        this.adminId,
        this.emailVerifiedAt,
        this.slug,
        this.resetToken,
        this.createdAt,
        this.updatedAt,
        this.regtime,
        this.deviceId,
        this.otp,
        this.otpExpiresAt,
        this.address,
        this.landmark,
        this.cCode,
        this.wpNum});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    type = json['type'];
    tokenStatus = json['token_status'];
    customerId = json['customer_id'];
    adminId = json['admin_id'];
    emailVerifiedAt = json['email_verified_at'];
    slug = json['slug'];
    resetToken = json['reset_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    regtime = json['regtime'];
    deviceId = json['device_id'];
    otp = json['otp'];
    otpExpiresAt = json['otp_expires_at'];
    address = json['address'];
    landmark = json['landmark'];
    cCode = json['c_code'];
    wpNum = json['wp_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['type'] = this.type;
    data['token_status'] = this.tokenStatus;
    data['customer_id'] = this.customerId;
    data['admin_id'] = this.adminId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['slug'] = this.slug;
    data['reset_token'] = this.resetToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['regtime'] = this.regtime;
    data['device_id'] = this.deviceId;
    data['otp'] = this.otp;
    data['otp_expires_at'] = this.otpExpiresAt;
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['c_code'] = this.cCode;
    data['wp_num'] = this.wpNum;
    return data;
  }
}
