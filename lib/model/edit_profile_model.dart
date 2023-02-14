class edit_profile_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  edit_profile_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  edit_profile_model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
      data['data'] = this.data!.toJson();
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
  bool? acknowledged;
  int? modifiedCount;
  Null? upsertedId;
  int? upsertedCount;
  int? matchedCount;

  Data(
      {this.acknowledged,
        this.modifiedCount,
        this.upsertedId,
        this.upsertedCount,
        this.matchedCount});

  Data.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    modifiedCount = json['modifiedCount'];
    upsertedId = json['upsertedId'];
    upsertedCount = json['upsertedCount'];
    matchedCount = json['matchedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acknowledged'] = this.acknowledged;
    data['modifiedCount'] = this.modifiedCount;
    data['upsertedId'] = this.upsertedId;
    data['upsertedCount'] = this.upsertedCount;
    data['matchedCount'] = this.matchedCount;
    return data;
  }
}
