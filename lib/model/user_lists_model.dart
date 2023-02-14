class user_list_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  user_list_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  user_list_model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  int? length;

  Metadata({this.length});

  Metadata.fromJson(Map<String, dynamic> json) {
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    return data;
  }
}

class Data {
  String? sId;
  String? userName;
  String? age;
  String? userPhoto;
  String? homeTown;
  String? designation;

  Data(
      {this.sId,
        this.userName,
        this.age,
        this.userPhoto,
        this.homeTown,
        this.designation});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['user_name'];
    age = json['age'];
    userPhoto = json['user_photo'];
    homeTown = json['home_town'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_name'] = this.userName;
    data['age'] = this.age;
    data['user_photo'] = this.userPhoto;
    data['home_town'] = this.homeTown;
    data['designation'] = this.designation;
    return data;
  }
}
