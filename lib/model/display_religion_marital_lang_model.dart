class display_religion_marital_lang_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  display_religion_marital_lang_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  display_religion_marital_lang_model.fromJson(Map<String, dynamic> json) {
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
  List<HomeTown>? homeTown;
  List<Religion>? religion;
  List<MaritalStatus>? maritalStatus;
  List<MotherTongue>? motherTongue;
  List<SettleDown>? settleDown;
  List<Community>? community;

  Data(
      {this.homeTown,
        this.religion,
        this.maritalStatus,
        this.motherTongue,
        this.settleDown,
        this.community});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['home_town'] != null) {
      homeTown = <HomeTown>[];
      json['home_town'].forEach((v) {
        homeTown!.add(new HomeTown.fromJson(v));
      });
    }
    if (json['religion'] != null) {
      religion = <Religion>[];
      json['religion'].forEach((v) {
        religion!.add(new Religion.fromJson(v));
      });
    }
    if (json['marital_status'] != null) {
      maritalStatus = <MaritalStatus>[];
      json['marital_status'].forEach((v) {
        maritalStatus!.add(new MaritalStatus.fromJson(v));
      });
    }
    if (json['mother_tongue'] != null) {
      motherTongue = <MotherTongue>[];
      json['mother_tongue'].forEach((v) {
        motherTongue!.add(new MotherTongue.fromJson(v));
      });
    }
    if (json['settle_down'] != null) {
      settleDown = <SettleDown>[];
      json['settle_down'].forEach((v) {
        settleDown!.add(new SettleDown.fromJson(v));
      });
    }
    if (json['community'] != null) {
      community = <Community>[];
      json['community'].forEach((v) {
        community!.add(new Community.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeTown != null) {
      data['home_town'] = this.homeTown!.map((v) => v.toJson()).toList();
    }
    if (this.religion != null) {
      data['religion'] = this.religion!.map((v) => v.toJson()).toList();
    }
    if (this.maritalStatus != null) {
      data['marital_status'] =
          this.maritalStatus!.map((v) => v.toJson()).toList();
    }
    if (this.motherTongue != null) {
      data['mother_tongue'] =
          this.motherTongue!.map((v) => v.toJson()).toList();
    }
    if (this.settleDown != null) {
      data['settle_down'] = this.settleDown!.map((v) => v.toJson()).toList();
    }
    if (this.community != null) {
      data['community'] = this.community!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeTown {
  String? sId;
  String? htName;
  int? iV;

  HomeTown({this.sId, this.htName, this.iV});

  HomeTown.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    htName = json['ht_name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['ht_name'] = this.htName;
    data['__v'] = this.iV;
    return data;
  }
}

class Religion {
  String? sId;
  String? religiousName;
  int? iV;

  Religion({this.sId, this.religiousName, this.iV});

  Religion.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    religiousName = json['religious_name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['religious_name'] = this.religiousName;
    data['__v'] = this.iV;
    return data;
  }
}

class MaritalStatus {
  String? sId;
  String? status;
  int? iV;

  MaritalStatus({this.sId, this.status, this.iV});

  MaritalStatus.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}

class MotherTongue {
  String? sId;
  String? mtName;
  int? iV;

  MotherTongue({this.sId, this.mtName, this.iV});

  MotherTongue.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mtName = json['mt_name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['mt_name'] = this.mtName;
    data['__v'] = this.iV;
    return data;
  }
}

class SettleDown {
  String? sId;
  String? settleDownValue;
  int? iV;

  SettleDown({this.sId, this.settleDownValue, this.iV});

  SettleDown.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    settleDownValue = json['settle_down_value'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['settle_down_value'] = this.settleDownValue;
    data['__v'] = this.iV;
    return data;
  }
}

class Community {
  String? sId;
  String? communityName;
  String? religionId;
  int? iV;

  Community({this.sId, this.communityName, this.religionId, this.iV});

  Community.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    communityName = json['community_name'];
    religionId = json['religion_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['community_name'] = this.communityName;
    data['religion_id'] = this.religionId;
    data['__v'] = this.iV;
    return data;
  }
}
