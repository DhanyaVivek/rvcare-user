class ModelNotification {
  List<Notificationlist>? notificationlist;

  ModelNotification({this.notificationlist});

  ModelNotification.fromJson(Map<String, dynamic> json) {
    if (json['notificationlist'] != null) {
      notificationlist = <Notificationlist>[];
      json['notificationlist'].forEach((v) {
        notificationlist!.add(new Notificationlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificationlist != null) {
      data['notificationlist'] =
          this.notificationlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notificationlist {
  int? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  Data? data;
  Null? readAt;
  String? createdAt;
  String? updatedAt;

  Notificationlist(
      {this.id,
        this.type,
        this.notifiableType,
        this.notifiableId,
        this.data,
        this.readAt,
        this.createdAt,
        this.updatedAt});

  Notificationlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['notifiable_type'] = this.notifiableType;
    data['notifiable_id'] = this.notifiableId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = this.readAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Data {
  int? customerId;
  String? title;
  String? body;

  Data({this.customerId, this.title, this.body});

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
