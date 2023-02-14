class user_details_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  user_details_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  user_details_model.fromJson(Map<String, dynamic> json) {
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
  String? contactNo;
  String? email;
  String? age;
  int? weight;
  String? country;
  String? gender;
  String? dob;
  String? userPhoto;
  String? bio;
  String? maritalStatus;
  String? religion;
  String? motherTongue;
  String? community;
  String? settleDown;
  String? homeTown;
  String? height;
  String? highestQualification;
  String? college;
  String? jobTitle;
  String? companyName;
  String? salary;
  String? foodPreference;
  String? smoke;
  String? drink;
  String? status;
  String? memberType;
  int? iV;
  List<Preference>? preference;
  List<Family>? family;
  Request? request;

  Data(
      {this.sId,
        this.userName,
        this.contactNo,
        this.email,
        this.age,
        this.weight,
        this.country,
        this.gender,
        this.dob,
        this.userPhoto,
        this.bio,
        this.maritalStatus,
        this.religion,
        this.motherTongue,
        this.community,
        this.settleDown,
        this.homeTown,
        this.height,
        this.highestQualification,
        this.college,
        this.jobTitle,
        this.companyName,
        this.salary,
        this.foodPreference,
        this.smoke,
        this.drink,
        this.status,
        this.memberType,
        this.iV,
        this.preference,
        this.family,
        this.request});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['user_name'];
    contactNo = json['contact_no'];
    email = json['email'];
    age = json['age'];
    weight = json['weight'];
    country = json['country'];
    gender = json['gender'];
    dob = json['dob'];
    userPhoto = json['user_photo'];
    bio = json['bio'];
    maritalStatus = json['marital_status'];
    religion = json['religion'];
    motherTongue = json['mother_tongue'];
    community = json['community'];
    settleDown = json['settle_down'];
    homeTown = json['home_town'];
    height = json['height'];
    highestQualification = json['highest_qualification'];
    college = json['college'];
    jobTitle = json['job_title'];
    companyName = json['company_name'];
    salary = json['salary'];
    foodPreference = json['food_preference'];
    smoke = json['smoke'];
    drink = json['drink'];
    status = json['status'];
    memberType = json['member_type'];
    iV = json['__v'];
    if (json['preference'] != null) {
      preference = <Preference>[];
      json['preference'].forEach((v) {
        preference!.add(new Preference.fromJson(v));
      });
    }
    if (json['family'] != null) {
      family = <Family>[];
      json['family'].forEach((v) {
        family!.add(new Family.fromJson(v));
      });
    }
    request =
    json['request'] != null ? new Request.fromJson(json['request']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_name'] = this.userName;
    data['contact_no'] = this.contactNo;
    data['email'] = this.email;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['country'] = this.country;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['user_photo'] = this.userPhoto;
    data['bio'] = this.bio;
    data['marital_status'] = this.maritalStatus;
    data['religion'] = this.religion;
    data['mother_tongue'] = this.motherTongue;
    data['community'] = this.community;
    data['settle_down'] = this.settleDown;
    data['home_town'] = this.homeTown;
    data['height'] = this.height;
    data['highest_qualification'] = this.highestQualification;
    data['college'] = this.college;
    data['job_title'] = this.jobTitle;
    data['company_name'] = this.companyName;
    data['salary'] = this.salary;
    data['food_preference'] = this.foodPreference;
    data['smoke'] = this.smoke;
    data['drink'] = this.drink;
    data['status'] = this.status;
    data['member_type'] = this.memberType;
    data['__v'] = this.iV;
    if (this.preference != null) {
      data['preference'] = this.preference!.map((v) => v.toJson()).toList();
    }
    if (this.family != null) {
      data['family'] = this.family!.map((v) => v.toJson()).toList();
    }
    if (this.request != null) {
      data['request'] = this.request!.toJson();
    }
    return data;
  }
}

class Preference {
  String? sId;
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
  String? userdetailId;
  int? iV;

  Preference(
      {this.sId,
        this.maritalStatus,
        this.religion,
        this.minAge,
        this.maxAge,
        this.annualIncome,
        this.foodPreferences,
        this.minHeight,
        this.maxHeight,
        this.language,
        this.location,
        this.userdetailId,
        this.iV});

  Preference.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    userdetailId = json['userdetail_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
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
    data['userdetail_id'] = this.userdetailId;
    data['__v'] = this.iV;
    return data;
  }
}

class Family {
  String? sId;
  String? fatherOccupation;
  String? motherOccupation;
  dynamic? noOfBrother;
  dynamic? noOfSister;
  dynamic? noOfMarriedBrother;
  dynamic? noOfMarriedSister;
  String? userId;
  int? iV;

  Family(
      {this.sId,
        this.fatherOccupation,
        this.motherOccupation,
        this.noOfBrother,
        this.noOfSister,
        this.noOfMarriedBrother,
        this.noOfMarriedSister,
        this.userId,
        this.iV});

  Family.fromJson(Map<String, dynamic> json) {
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

class Request {
  String? sId;
  String? senderId;
  String? receiverId;
  String? requestStatus;
  String? requestType;
  String? requestDate;
  int? iV;

  Request(
      {this.sId,
        this.senderId,
        this.receiverId,
        this.requestStatus,
        this.requestType,
        this.requestDate,
        this.iV});

  Request.fromJson(Map<String, dynamic> json) {
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
