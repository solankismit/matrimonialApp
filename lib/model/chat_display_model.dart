class Chat_display_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  Chat_display_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  Chat_display_model.fromJson(Map<String, dynamic> json) {
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
  String? senderId;
  String? receiverId;
  String? msg;
  String? msgDate;
  int? iV;

  Data(
      {this.sId,
        this.senderId,
        this.receiverId,
        this.msg,
        this.msgDate,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    msg = json['msg'];
    msgDate = json['msg_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['msg'] = this.msg;
    data['msg_date'] = this.msgDate;
    data['__v'] = this.iV;
    return data;
  }
}
