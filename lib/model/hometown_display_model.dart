// class hometown_display_model {
//   int? code;
//   String? status;
//   String? message;
//   Metadata? metadata;
//   List<Data>? data;
//
//   hometown_display_model(
//       {this.code, this.status, this.message, this.metadata, this.data});
//
//   hometown_display_model.fromJson(Map<String, dynamic> json) {
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
//   String? htName;
//   int? iV;
//
//   Data({this.sId, this.htName, this.iV});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     htName = json['ht_name'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['ht_name'] = this.htName;
//     data['__v'] = this.iV;
//     return data;
//   }
// }



// class hometown_display_model {
//   List<Data>? data;
//
//   hometown_display_model({this.data});
//
//   hometown_display_model.fromJson(Map<String, dynamic> json) {
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
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? name;
//
//   Data({this.name});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     return data;
//   }
// }

class hometown_display_model{
  List<hometownlist_display_model>? data;
  hometown_display_model({this.data});
  factory hometown_display_model.fromJson(List<dynamic> parsedJson) {

    List<hometownlist_display_model>? towns = <hometownlist_display_model>[];
    print(parsedJson);
    towns = parsedJson.map((i)=>hometownlist_display_model.fromJson(i)).cast<hometownlist_display_model>().toList();
    return new hometown_display_model(
      data: towns,
    );
  }
}



class hometown {
  String? name;

  hometown({this.name});

  factory hometown.fromJson(Map<String, dynamic> json){
    return new hometown(name:json['name']['common']);
  }
}


class hometownlist_display_model {
  String? name;
  String? currency;
  String? currencySymbol;
  String? region;
  String? subregion;
  List<States>? states;

  hometownlist_display_model(
      {this.name,
        this.currency,
        this.currencySymbol,
        this.region,
        this.subregion,
        this.states});

  hometownlist_display_model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    currency = json['currency'];
    currencySymbol = json['currency_symbol'];
    region = json['region'];
    subregion = json['subregion'];
    if (json['states'] != null) {
      states = <States>[];
      json['states'].forEach((v) {
        states!.add(new States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['currency_symbol'] = this.currencySymbol;
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    if (this.states != null) {
      data['states'] = this.states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  int? id;
  String? name;
  List<Cities>? cities;

  States({this.id, this.name, this.cities});

  States.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  int? id;
  String? name;

  Cities({this.id, this.name});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
