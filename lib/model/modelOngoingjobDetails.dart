class ModelOngoingjobDetls {
  int? userId;
  String? typeWork;
  String? date;
  String? time;
  String? address;
  String? timeSection;
  String? description;
  String? mobile;
  String? location;
  int? status;
  String? estimateDate;
  String? estTime;
  String? serviceOffered;
  String? servicePrice;
  String? material;
  String? materialPrice;

  ModelOngoingjobDetls(
      {this.userId,
        this.typeWork,
        this.date,
        this.time,
        this.address,
        this.timeSection,
        this.description,
        this.mobile,
        this.location,
        this.status,
        this.estimateDate,
        this.estTime,
        this.serviceOffered,
        this.servicePrice,
        this.material,
        this.materialPrice});

  ModelOngoingjobDetls.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    typeWork = json['type_work'];
    date = json['date'];
    time = json['time'];
    address = json['address'];
    timeSection = json['time_section'];
    description = json['description'];
    mobile = json['mobile'];
    location = json['location'];
    status = json['status'];
    estimateDate = json['estimate_date'];
    estTime = json['est_time'];
    serviceOffered = json['service_offered'];
    servicePrice = json['service_price'];
    material = json['material'];
    materialPrice = json['material_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['type_work'] = this.typeWork;
    data['date'] = this.date;
    data['time'] = this.time;
    data['address'] = this.address;
    data['time_section'] = this.timeSection;
    data['description'] = this.description;
    data['mobile'] = this.mobile;
    data['location'] = this.location;
    data['status'] = this.status;
    data['estimate_date'] = this.estimateDate;
    data['est_time'] = this.estTime;
    data['service_offered'] = this.serviceOffered;
    data['service_price'] = this.servicePrice;
    data['material'] = this.material;
    data['material_price'] = this.materialPrice;
    return data;
  }
}
