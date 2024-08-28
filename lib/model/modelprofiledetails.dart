class ProfileDetails {
  int? id;
  String? name;
  String? mobile;
  String? landmark;
  String? address;
  String? message;

  ProfileDetails(
      {this.id,
        this.name,
        this.mobile,
        this.landmark,
        this.address,
        this.message});

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    landmark = json['landmark'];
    address = json['address'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['landmark'] = this.landmark;
    data['address'] = this.address;
    data['message'] = this.message;
    return data;
  }
}
