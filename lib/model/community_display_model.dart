class community_display_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  community_display_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  community_display_model.fromJson(Map<String, dynamic> json) {
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
  String? religiousName;
  int? iV;
  List<Communities>? communities;

  Data({this.sId, this.religiousName, this.iV, this.communities});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    religiousName = json['religious_name'];
    iV = json['__v'];
    if (json['communities'] != null) {
      communities = <Communities>[];
      json['communities'].forEach((v) {
        communities!.add(new Communities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['religious_name'] = this.religiousName;
    data['__v'] = this.iV;
    if (this.communities != null) {
      data['communities'] = this.communities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Communities {
  String? sId;
  String? communityName;
  String? religionId;
  int? iV;

  Communities({this.sId, this.communityName, this.religionId, this.iV});

  Communities.fromJson(Map<String, dynamic> json) {
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
