class add_family_details_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  add_family_details_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  add_family_details_model.fromJson(Map<String, dynamic> json) {
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
  String? fatherOccupation;
  String? motherOccupation;
  int? noOfBrother;
  int? noOfSister;
  int? noOfMarriedBrother;
  int? noOfMarriedSister;
  String? userId;
  String? sId;
  int? iV;

  Data(
      {this.fatherOccupation,
        this.motherOccupation,
        this.noOfBrother,
        this.noOfSister,
        this.noOfMarriedBrother,
        this.noOfMarriedSister,
        this.userId,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    fatherOccupation = json['father_occupation'];
    motherOccupation = json['mother_occupation'];
    noOfBrother = json['no_of_brother'];
    noOfSister = json['no_of_sister'];
    noOfMarriedBrother = json['no_of_married_brother'];
    noOfMarriedSister = json['no_of_married_sister'];
    userId = json['user_id'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['father_occupation'] = this.fatherOccupation;
    data['mother_occupation'] = this.motherOccupation;
    data['no_of_brother'] = this.noOfBrother;
    data['no_of_sister'] = this.noOfSister;
    data['no_of_married_brother'] = this.noOfMarriedBrother;
    data['no_of_married_sister'] = this.noOfMarriedSister;
    data['user_id'] = this.userId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
