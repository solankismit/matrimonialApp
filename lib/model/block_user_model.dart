class block_user_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  block_user_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  block_user_model.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? blockId;
  String? sId;
  String? blockDate;
  int? iV;

  Data({this.userId, this.blockId, this.sId, this.blockDate, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    blockId = json['block_id'];
    sId = json['_id'];
    blockDate = json['block_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['block_id'] = this.blockId;
    data['_id'] = this.sId;
    data['block_date'] = this.blockDate;
    data['__v'] = this.iV;
    return data;
  }
}
