// class profile_dispaly_model {
//   int? code;
//   String? status;
//   String? message;
//   Metadata? metadata;
//   List<Data>? data;
//
//   profile_dispaly_model(
//       {this.code, this.status, this.message, this.metadata, this.data});
//
//   profile_dispaly_model.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     status = json['status'];
//     message = json['message'];
//     metadata = json['metadata'] != null
//         ? new Metadata.fromJson(json['metadata'])
//         : null;
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.metadata != null) {
//       data['metadata'] = this.metadata!.toJson();
//     }
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Metadata {
//   int? length;
//
//   Metadata({this.length});
//
//   Metadata.fromJson(Map<String, dynamic> json) {
//     length = json['length'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['length'] = this.length;
//     return data;
//   }
// }
//
// class Data {
//   String? sId;
//   int? contactNo;
//   String? role;
//   String? password;
//   int? iV;
//   Profile? profile;
//
//   Data(
//       {this.sId,
//         this.contactNo,
//         this.role,
//         this.password,
//         this.iV,
//         this.profile});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     contactNo = json['contact_no'];
//     role = json['role'];
//     password = json['password'];
//     iV = json['__v'];
//     profile =
//     json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['contact_no'] = this.contactNo;
//     data['role'] = this.role;
//     data['password'] = this.password;
//     data['__v'] = this.iV;
//     if (this.profile != null) {
//       data['profile'] = this.profile!.toJson();
//     }
//     return data;
//   }
// }
//
// class Profile {
//   String? sId;
//   String? userdetailsId;
//   String? userName;
//   String? email;
//   String? gender;
//   String? dob;
//   String? userPhoto;
//   String? bio;
//   String? maritalStatus;
//   String? religion;
//   String? motherTongue;
//   String? community;
//   String? settleDown;
//   String? homeTown;
//   String? height;
//   String? highestQualification;
//   String? college;
//   String? jobTitle;
//   String? companyName;
//   String? salary;
//   String? foodPreference;
//   String? smoke;
//   String? drink;
//   String? status;
//   String? memberType;
//   String? membershipPlan;
//   Null? membershipDate;
//   int? iV;
//
//   Profile(
//       {this.sId,
//         this.userdetailsId,
//         this.userName,
//         this.email,
//         this.gender,
//         this.dob,
//         this.userPhoto,
//         this.bio,
//         this.maritalStatus,
//         this.religion,
//         this.motherTongue,
//         this.community,
//         this.settleDown,
//         this.homeTown,
//         this.height,
//         this.highestQualification,
//         this.college,
//         this.jobTitle,
//         this.companyName,
//         this.salary,
//         this.foodPreference,
//         this.smoke,
//         this.drink,
//         this.status,
//         this.memberType,
//         this.membershipPlan,
//         this.membershipDate,
//         this.iV});
//
//   Profile.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     userdetailsId = json['userdetails_id'];
//     userName = json['user_name'];
//     email = json['email'];
//     gender = json['gender'];
//     dob = json['dob'];
//     userPhoto = json['user_photo'];
//     bio = json['bio'];
//     maritalStatus = json['marital_status'];
//     religion = json['religion'];
//     motherTongue = json['mother_tongue'];
//     community = json['community'];
//     settleDown = json['settle_down'];
//     homeTown = json['home_town'];
//     height = json['height'];
//     highestQualification = json['highest_qualification'];
//     college = json['college'];
//     jobTitle = json['job_title'];
//     companyName = json['company_name'];
//     salary = json['salary'];
//     foodPreference = json['food_preference'];
//     smoke = json['smoke'];
//     drink = json['drink'];
//     status = json['status'];
//     memberType = json['member_type'];
//     membershipPlan = json['membership_plan'];
//     membershipDate = json['membership_date'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['userdetails_id'] = this.userdetailsId;
//     data['user_name'] = this.userName;
//     data['email'] = this.email;
//     data['gender'] = this.gender;
//     data['dob'] = this.dob;
//     data['user_photo'] = this.userPhoto;
//     data['bio'] = this.bio;
//     data['marital_status'] = this.maritalStatus;
//     data['religion'] = this.religion;
//     data['mother_tongue'] = this.motherTongue;
//     data['community'] = this.community;
//     data['settle_down'] = this.settleDown;
//     data['home_town'] = this.homeTown;
//     data['height'] = this.height;
//     data['highest_qualification'] = this.highestQualification;
//     data['college'] = this.college;
//     data['job_title'] = this.jobTitle;
//     data['company_name'] = this.companyName;
//     data['salary'] = this.salary;
//     data['food_preference'] = this.foodPreference;
//     data['smoke'] = this.smoke;
//     data['drink'] = this.drink;
//     data['status'] = this.status;
//     data['member_type'] = this.memberType;
//     data['membership_plan'] = this.membershipPlan;
//     data['membership_date'] = this.membershipDate;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
