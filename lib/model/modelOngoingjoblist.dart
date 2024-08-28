class ModelOngoingservicelist {
  String? message;
  List<Ongoinglist>? ongoinglist;

  ModelOngoingservicelist({this.message, this.ongoinglist});

  ModelOngoingservicelist.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['ongoinglist'] != null) {
      ongoinglist = <Ongoinglist>[];
      json['ongoinglist'].forEach((v) {
        ongoinglist!.add(new Ongoinglist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.ongoinglist != null) {
      data['ongoinglist'] = this.ongoinglist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ongoinglist {
  int? id;
  int? userId;
  String? mobile;
  String? address;
  String? landmark;
  String? location;
  String? description;
  String? typeWork;
  String? date;
  String? time;
  int? status;

  Ongoinglist(
      {this.id,
        this.userId,
        this.mobile,
        this.address,
        this.landmark,
        this.location,
        this.description,
        this.typeWork,
        this.date,
        this.time,
        this.status});

  Ongoinglist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    mobile = json['mobile'];
    address = json['address'];
    landmark = json['landmark'];
    location = json['location'];
    description = json['description'];
    typeWork = json['type_work'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['location'] = this.location;
    data['description'] = this.description;
    data['type_work'] = this.typeWork;
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    return data;
  }
}
