class update_request_model {
  bool? isSuccess;
  int? status;
  Data? data;
  String? message;

  update_request_model({this.isSuccess, this.status, this.data, this.message});

  update_request_model.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  String? senderId;
  String? receiverId;
  String? requestStatus;
  String? requestType;
  String? requestDate;
  int? iV;

  Data(
      {this.sId,
        this.senderId,
        this.receiverId,
        this.requestStatus,
        this.requestType,
        this.requestDate,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    requestStatus = json['request_status'];
    requestType = json['request_type'];
    requestDate = json['request_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['request_status'] = this.requestStatus;
    data['request_type'] = this.requestType;
    data['request_date'] = this.requestDate;
    data['__v'] = this.iV;
    return data;
  }
}
