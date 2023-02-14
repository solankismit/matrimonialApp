class display_family_details_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  display_family_details_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  display_family_details_model.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? fatherOccupation;
  String? motherOccupation;
  int? noOfBrother;
  int? noOfSister;
  int? noOfMarriedBrother;
  int? noOfMarriedSister;
  String? userId;
  int? iV;

  Data(
      {this.sId,
        this.fatherOccupation,
        this.motherOccupation,
        this.noOfBrother,
        this.noOfSister,
        this.noOfMarriedBrother,
        this.noOfMarriedSister,
        this.userId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fatherOccupation = json['father_occupation'];
    motherOccupation = json['mother_occupation'];
    noOfBrother = json['no_of_brother'];
    noOfSister = json['no_of_sister'];
    noOfMarriedBrother = json['no_of_married_brother'];
    noOfMarriedSister = json['no_of_married_sister'];
    userId = json['user_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['father_occupation'] = this.fatherOccupation;
    data['mother_occupation'] = this.motherOccupation;
    data['no_of_brother'] = this.noOfBrother;
    data['no_of_sister'] = this.noOfSister;
    data['no_of_married_brother'] = this.noOfMarriedBrother;
    data['no_of_married_sister'] = this.noOfMarriedSister;
    data['user_id'] = this.userId;
    data['__v'] = this.iV;
    return data;
  }
}
