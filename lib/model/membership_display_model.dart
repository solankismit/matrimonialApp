class membership_display_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  membership_display_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  membership_display_model.fromJson(Map<String, dynamic> json) {
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
  String? planName;
  int? planDays;
  int? planOriginalPrice;
  int? planSellingPrice;
  int? contactLimit;
  List<MembershipFeatureId>? membershipFeatureId;
  int? iV;

  Data(
      {this.sId,
        this.planName,
        this.planDays,
        this.planOriginalPrice,
        this.planSellingPrice,
        this.contactLimit,
        this.membershipFeatureId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    planName = json['plan_name'];
    planDays = json['plan_days'];
    planOriginalPrice = json['plan_original_price'];
    planSellingPrice = json['plan_selling_price'];
    contactLimit = json['contact_limit'];
    if (json['membership_feature_id'] != null) {
      membershipFeatureId = <MembershipFeatureId>[];
      json['membership_feature_id'].forEach((v) {
        membershipFeatureId!.add(new MembershipFeatureId.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['plan_name'] = this.planName;
    data['plan_days'] = this.planDays;
    data['plan_original_price'] = this.planOriginalPrice;
    data['plan_selling_price'] = this.planSellingPrice;
    data['contact_limit'] = this.contactLimit;
    if (this.membershipFeatureId != null) {
      data['membership_feature_id'] =
          this.membershipFeatureId!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class MembershipFeatureId {
  String? membershipId;
  bool? membershipFeatureStatus;
  String? sId;

  MembershipFeatureId(
      {this.membershipId, this.membershipFeatureStatus, this.sId});

  MembershipFeatureId.fromJson(Map<String, dynamic> json) {
    membershipId = json['membership_id'];
    membershipFeatureStatus = json['membership_feature_status'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['membership_id'] = this.membershipId;
    data['membership_feature_status'] = this.membershipFeatureStatus;
    data['_id'] = this.sId;
    return data;
  }
}
