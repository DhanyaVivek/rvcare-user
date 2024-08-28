class ModelEstimatedetails {
  int? id;
  int? userId;
  String? serviceOffered;
  int? servicePrice;
  String? material;
  int? materialPrice;
  String? estimateDate;
  String? total;
  String? estTime;

  ModelEstimatedetails(
      {this.id,
        this.userId,
        this.serviceOffered,
        this.servicePrice,
        this.material,
        this.materialPrice,
        this.estimateDate,
        this.total,
        this.estTime});

  ModelEstimatedetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceOffered = json['service_offered'];
    servicePrice = json['service_price'];
    material = json['material'];
    materialPrice = json['material_price'];
    estimateDate = json['estimate_date'];
    total = json['total'];
    estTime = json['est_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['service_offered'] = this.serviceOffered;
    data['service_price'] = this.servicePrice;
    data['material'] = this.material;
    data['material_price'] = this.materialPrice;
    data['estimate_date'] = this.estimateDate;
    data['total'] = this.total;
    data['est_time'] = this.estTime;
    return data;
  }
}
