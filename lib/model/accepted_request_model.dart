class accepted_request_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  accepted_request_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  accepted_request_model.fromJson(Map<String, dynamic> json) {
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
  List<Received>? received;
  List<Sent>? sent;

  Data({this.received, this.sent});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['received'] != null) {
      received = <Received>[];
      json['received'].forEach((v) {
        received!.add(new Received.fromJson(v));
      });
    }
    if (json['sent'] != null) {
      sent = <Sent>[];
      json['sent'].forEach((v) {
        sent!.add(new Sent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.received != null) {
      data['received'] = this.received!.map((v) => v.toJson()).toList();
    }
    if (this.sent != null) {
      data['sent'] = this.sent!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Received {
  String? sId;
  String? senderId;
  String? receiverId;
  String? requestStatus;
  String? requestType;
  String? requestDate;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Profile>? profile;

  Received(
      {this.sId,
        this.senderId,
        this.receiverId,
        this.requestStatus,
        this.requestType,
        this.requestDate,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.profile});

  Received.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    requestStatus = json['request_status'];
    requestType = json['request_type'];
    requestDate = json['request_date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['profile'] != null) {
      profile = <Profile>[];
      json['profile'].forEach((v) {
        profile!.add(new Profile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['request_status'] = this.requestStatus;
    data['request_type'] = this.requestType;
    data['request_date'] = this.requestDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.profile != null) {
      data['profile'] = this.profile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
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
  String? designation;

  Profile(
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
        this.userPhoto,
        this.designation});

  Profile.fromJson(Map<String, dynamic> json) {
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
    designation = json['designation'];
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
    data['designation'] = this.designation ?? "";
    return data;
  }
}

class Sent {
  String? sId;
  String? senderId;
  String? receiverId;
  String? requestStatus;
  String? requestType;
  String? requestDate;
  int? iV;
  List<Profile>? profile;

  Sent(
      {this.sId,
        this.senderId,
        this.receiverId,
        this.requestStatus,
        this.requestType,
        this.requestDate,
        this.iV,
        this.profile});

  Sent.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    requestStatus = json['request_status'];
    requestType = json['request_type'];
    requestDate = json['request_date'];
    iV = json['__v'];
    if (json['profile'] != null) {
      profile = <Profile>[];
      json['profile'].forEach((v) {
        profile!.add(new Profile.fromJson(v));
      });
    }
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
    if (this.profile != null) {
      data['profile'] = this.profile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}