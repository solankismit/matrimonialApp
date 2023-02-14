class user_display_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  user_display_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  user_display_model.fromJson(Map<String, dynamic> json) {
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
  List<User>? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? sId;
  String? userName;
  String? contactNo;
  String? email;
  String? age;
  int? weight;
  String? country;
  String? gender;
  String? dob;
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
  String? userPhoto;

  User(
      {this.sId,
        this.userName,
        this.contactNo,
        this.email,
        this.age,
        this.weight,
        this.country,
        this.gender,
        this.dob,
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
        this.userPhoto});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['user_name'];
    contactNo = json['contact_no'];
    email = json['email'];
    age = json['age'];
    weight = json['weight'];
    country = json['country'];
    gender = json['gender'];
    dob = json['dob'];
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
    userPhoto = json['user_photo'];
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
    data['user_photo'] = this.userPhoto;
    return data;
  }
}
