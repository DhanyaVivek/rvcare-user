class ModelRequestservice {
  String? message;
  String? userId;
  String? typeWork;
  String? date;
  String? time;
  String? timeSection;
  String? location;
  String? address;
  String? mobile;
  String? description;

  ModelRequestservice(
      {this.message,
        this.userId,
        this.typeWork,
        this.date,
        this.time,
        this.timeSection,
        this.location,
        this.address,
        this.mobile,
        this.description});

  ModelRequestservice.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['user_id'];
    typeWork = json['type_work'];
    date = json['date'];
    time = json['time'];
    timeSection = json['time_section'];
    location = json['location'];
    address = json['address'];
    mobile = json['mobile'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['type_work'] = this.typeWork;
    data['date'] = this.date;
    data['time'] = this.time;
    data['time_section'] = this.timeSection;
    data['location'] = this.location;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['description'] = this.description;
    return data;
  }
}
