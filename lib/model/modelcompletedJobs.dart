class ModelCompletedjobs {
  List<Completedservices>? completedservices;

  ModelCompletedjobs({this.completedservices});

  ModelCompletedjobs.fromJson(Map<String, dynamic> json) {
    if (json['completedservices'] != null) {
      completedservices = <Completedservices>[];
      json['completedservices'].forEach((v) {
        completedservices!.add(new Completedservices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.completedservices != null) {
      data['completedservices'] =
          this.completedservices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Completedservices {
  int? id;
  int? userId;
  String? mobile;
  String? address;
  String? landmark;
  String? description;
  String? typeWork;
  int? amnt;
  String? paymentDate;
  String? paymentTime;
  String? paymentMode;
  int? status;
  String? estimateDate;
  String? estTime;
  String? serviceOffered;
  String? servicePrice;
  String? material;
  String? materialPrice;

  Completedservices(
      {this.id,
        this.userId,
        this.mobile,
        this.address,
        this.landmark,
        this.description,
        this.typeWork,
        this.amnt,
        this.paymentDate,
        this.paymentTime,
        this.paymentMode,
        this.status,
        this.estimateDate,
        this.estTime,
        this.serviceOffered,
        this.servicePrice,
        this.material,
        this.materialPrice});

  Completedservices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    mobile = json['mobile'];
    address = json['address'];
    landmark = json['landmark'];
    description = json['description'];
    typeWork = json['type_work'];
    amnt = json['amnt'];
    paymentDate = json['payment_date'];
    paymentTime = json['payment_time'];
    paymentMode = json['payment_mode'];
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
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['description'] = this.description;
    data['type_work'] = this.typeWork;
    data['amnt'] = this.amnt;
    data['payment_date'] = this.paymentDate;
    data['payment_time'] = this.paymentTime;
    data['payment_mode'] = this.paymentMode;
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
