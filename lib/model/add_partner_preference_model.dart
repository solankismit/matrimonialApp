class add_partner_preference_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  add_partner_preference_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  add_partner_preference_model.fromJson(Map<String, dynamic> json) {
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
  String? maritalStatus;
  List<String>? religion;
  int? minAge;
  int? maxAge;
  String? annualIncome;
  String? foodPreferences;
  String? minHeight;
  String? maxHeight;
  List<String>? language;
  String? location;
  String? drink;
  String? smoke;
  String? userdetailId;
  String? sId;
  int? iV;

  Data(
      {this.maritalStatus,
        this.religion,
        this.minAge,
        this.maxAge,
        this.annualIncome,
        this.foodPreferences,
        this.minHeight,
        this.maxHeight,
        this.language,
        this.location,
        this.drink,
        this.smoke,
        this.userdetailId,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    maritalStatus = json['marital_status'];
    religion = json['religion'].cast<String>();
    minAge = json['min_age'];
    maxAge = json['max_age'];
    annualIncome = json['annual_income'];
    foodPreferences = json['food_preferences'];
    minHeight = json['min_height'];
    maxHeight = json['max_height'];
    language = json['language'].cast<String>();
    location = json['location'];
    drink = json['drink'];
    smoke = json['smoke'];
    userdetailId = json['userdetail_id'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marital_status'] = this.maritalStatus;
    data['religion'] = this.religion;
    data['min_age'] = this.minAge;
    data['max_age'] = this.maxAge;
    data['annual_income'] = this.annualIncome;
    data['food_preferences'] = this.foodPreferences;
    data['min_height'] = this.minHeight;
    data['max_height'] = this.maxHeight;
    data['language'] = this.language;
    data['location'] = this.location;
    data['drink'] = this.drink;
    data['smoke'] = this.smoke;
    data['userdetail_id'] = this.userdetailId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
