class ModelCompletedjobdetails {
  Completed? completed;

  ModelCompletedjobdetails({this.completed});

  ModelCompletedjobdetails.fromJson(Map<String, dynamic> json) {
    completed = json['completed'] != null
        ? new Completed.fromJson(json['completed'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.completed != null) {
      data['completed'] = this.completed!.toJson();
    }
    return data;
  }
}

class Completed {
  int? userId;
  String? typeWork;
  String? paymentDate;
  String? time;
  String? paymentMode;
  String? paymentTime;
  String? description;
  String? mobile;
  int? amnt;
  String? address;
  String? location;
  int? status;

  Completed(
      {this.userId,
        this.typeWork,
        this.paymentDate,
        this.time,
        this.paymentMode,
        this.paymentTime,
        this.description,
        this.mobile,
        this.amnt,
        this.address,
        this.location,
        this.status});

  Completed.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    typeWork = json['type_work'];
    paymentDate = json['payment_date'];
    time = json['time'];
    paymentMode = json['payment_mode'];
    paymentTime = json['payment_time'];
    description = json['description'];
    mobile = json['mobile'];
    amnt = json['amnt'];
    address = json['address'];
    location = json['location'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['type_work'] = this.typeWork;
    data['payment_date'] = this.paymentDate;
    data['time'] = this.time;
    data['payment_mode'] = this.paymentMode;
    data['payment_time'] = this.paymentTime;
    data['description'] = this.description;
    data['mobile'] = this.mobile;
    data['amnt'] = this.amnt;
    data['address'] = this.address;
    data['location'] = this.location;
    data['status'] = this.status;
    return data;
  }
}
