class ModelEstimatelist {
  List<Estimatedservices>? estimatedservices;

  ModelEstimatelist({this.estimatedservices});

  ModelEstimatelist.fromJson(Map<String, dynamic> json) {
    if (json['estimatedservices'] != null) {
      estimatedservices = <Estimatedservices>[];
      json['estimatedservices'].forEach((v) {
        estimatedservices!.add(new Estimatedservices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.estimatedservices != null) {
      data['estimatedservices'] =
          this.estimatedservices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Estimatedservices {
  int? id;
  int? userId;
  String? mobile;
  String? address;
  String? location;
  String? description;
  String? typeWork;
  String? serviceOffered;
  int? servicePrice;
  String? material;
  int? materialPrice;
  String? estimateDate;
  String? total;
  String? estTime;
  int? status;

  Estimatedservices(
      {this.id,
        this.userId,
        this.mobile,
        this.address,
        this.location,
        this.description,
        this.typeWork,
        this.serviceOffered,
        this.servicePrice,
        this.material,
        this.materialPrice,
        this.estimateDate,
        this.total,
        this.estTime,
        this.status});

  Estimatedservices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    mobile = json['mobile'];
    address = json['address'];
    location = json['location'];
    description = json['description'];
    typeWork = json['type_work'];
    serviceOffered = json['service_offered'];
    servicePrice = json['service_price'];
    material = json['material'];
    materialPrice = json['material_price'];
    estimateDate = json['estimate_date'];
    total = json['total'];
    estTime = json['est_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['location'] = this.location;
    data['description'] = this.description;
    data['type_work'] = this.typeWork;
    data['service_offered'] = this.serviceOffered;
    data['service_price'] = this.servicePrice;
    data['material'] = this.material;
    data['material_price'] = this.materialPrice;
    data['estimate_date'] = this.estimateDate;
    data['total'] = this.total;
    data['est_time'] = this.estTime;
    data['status'] = this.status;
    return data;
  }
}
