import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:matrimonial_app/auth_screens/login_screen.dart';
import 'package:matrimonial_app/base_url.dart';
import 'package:matrimonial_app/model/accepted_request_model.dart';
import 'package:matrimonial_app/model/add_profile_model.dart';
import 'package:matrimonial_app/model/add_profile_pic_model.dart';
import 'package:matrimonial_app/model/block_user_model.dart';
import 'package:matrimonial_app/model/block_user_model.dart';
import 'package:matrimonial_app/model/college_display_model.dart';
import 'package:matrimonial_app/model/community_display_model.dart';
import 'package:matrimonial_app/model/company_display_model.dart';
import 'package:matrimonial_app/model/display_block_user_model.dart';
import 'package:matrimonial_app/model/display_block_user_model.dart';
import 'package:matrimonial_app/model/display_country_state_city_model.dart';
import 'package:matrimonial_app/model/display_country_state_city_model.dart';
import 'package:matrimonial_app/model/display_family_details_model.dart';
import 'package:matrimonial_app/model/display_family_details_model.dart';
import 'package:matrimonial_app/model/display_partner_preference_model.dart';
import 'package:matrimonial_app/model/display_request_model.dart';
import 'package:matrimonial_app/model/drink_display_model.dart';
import 'package:matrimonial_app/model/edit_profile_model.dart';
import 'package:matrimonial_app/model/food_preference_display_model.dart';
import 'package:matrimonial_app/model/height_display_model.dart';
import 'package:matrimonial_app/model/hometown_display_model.dart';
import 'package:matrimonial_app/model/add_partner_preference_model.dart';
import 'package:matrimonial_app/model/profile_display_model.dart';
import 'package:matrimonial_app/model/job_title_display_model.dart';
import 'package:matrimonial_app/model/maritalstatus_display_model.dart';
import 'package:matrimonial_app/model/membership_display_model.dart';
import 'package:matrimonial_app/model/mother_tongue_display_model.dart';
import 'package:matrimonial_app/model/qualification_display_model.dart';
import 'package:matrimonial_app/model/religion_display_model.dart';
import 'package:matrimonial_app/model/salary_display_model.dart';
import 'package:matrimonial_app/model/send_request_model.dart';
import 'package:matrimonial_app/model/settle_down_display_model.dart';
import 'package:matrimonial_app/model/profile_display_model.dart';
import 'package:matrimonial_app/model/sign_up_model.dart';
import 'package:matrimonial_app/model/smoke_display_model.dart';
import 'package:matrimonial_app/model/unblock_user_model.dart';
import 'package:matrimonial_app/model/update_family_details_model.dart';
import 'package:matrimonial_app/model/update_partner_preference_model.dart';
import 'package:matrimonial_app/model/update_request_model.dart';
import 'package:matrimonial_app/model/update_request_model.dart';
import 'package:matrimonial_app/model/user_details_model.dart';
import 'package:matrimonial_app/model/user_display_model.dart';
import 'package:matrimonial_app/model/user_lists_model.dart';
import 'package:matrimonial_app/utils/sharedprefsData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_family_details_model.dart';
import 'chat_display_model.dart';
import 'count_contact_model.dart';
import 'display_faq_model.dart';
import 'display_religion_marital_lang_model.dart';
import 'login_model.dart';
import 'membership_feature_display_model.dart';

class Login {
  Login();
  Future<login_model> loginList(contact_no) async {
    var url = LURL + "/api/profile/login";
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "content-type": "application/json",
        },
        body: json.encode({"contact_no": contact_no}));

    var data = json.decode(response.body);
    print("Login" + response.body);
    return login_model.fromJson(data);
  }
}

class signup {
  signup();
  Future<signup_model> signupList(contact_no) async {
    var url = LURL + "/api/user_detail/login";
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "content-type": "application/json",
        },
        body: json.encode({"contact_no": contact_no}));

    var data = json.decode(response.body);
    print("signup" + response.body);
    return signup_model.fromJson(data);
  }
}

class heightDisplay {
  heightDisplay();
  Future<height_display_model> heightDisplayList() async {
    var url = LURL + "/api/height";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display height" + response.body);
    return height_display_model.fromJson(data);
  }
}

class homeTownDisplay {
  homeTownDisplay();

  //WebEarl API
  // Future<hometown_display_model> homeTownDisplayList() async {
  //   var url = LURL + "/api/home_town";
  //   http.Response response = await http.get(
  //     Uri.parse(url),
  //     headers: {
  //       "content-type": "application/json",
  //       "Authorization":
  //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
  //     },
  //   );
  //   var data = json.decode(response.body);
  //   print("display hometown" + response.body);
  //   return hometown_display_model.fromJson(data);
  // }
  //

  //Country API
//   Future<hometown_display_model> homeTownDisplayList() async {
//     var url = "https://restcountries.com/v3.1/all";
//     http.Response response = await http.get(
//       Uri.parse(url),
//       headers: {
//         "content-type": "application/json",
//         // "Authorization":
//         // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
//       },
//     );
//     var data = json.decode(response.body);
//     // print("display hometown" + data);
//     return hometown_display_model.fromJson(data);
//   }

  Future<hometown_display_model> homeTownDisplayList() async {
    var url =
        "https://raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/countries%2Bstates%2Bcities.json";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        // "Authorization":
        // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display hometown" + response.body);
    return hometown_display_model.fromJson(data);
  }
}
//Display Country from Local Json
class countryDisplay {
  countryDisplay();
  Future<display_country_state_city_model> homeTownDisplayList() async {
    final String response = await rootBundle.loadString('assets/CountryStateCity.json');
    final data = await json.decode(response);
    print("display Country State City : " + response);
    return display_country_state_city_model.fromJson(data);
  }
}
class profile_display {
  profile_display();
  Future<user_display_model> profiledisplaydatalist() async {
    var url = LURL + "/api/profile/checkProfile";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final phone_no = prefs.getString(sharedPrefsData.phoneNo)!;
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          // "Authorzation":
          //         //     "eyiJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
        },
        body: jsonEncode({
          "contact_no": phone_no,
        }));
    print(response.body);
    var data = json.decode(response.body);
    print("profile_display" + data.toString());
    return user_display_model.fromJson(data);
  }
}

class chat_dispaly {
  chat_dispaly();
  Future<Chat_display_model> chatdisplaylist() async {
    var url = LURL + "/api/chat";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("chat_dispaly" + response.body);
    return Chat_display_model.fromJson(data);
  }
}

class religionDisplay {
  religionDisplay();
  Future<religion_display_model> religionDisplayList() async {
    var url = LURL + "/api/religion";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display religion" + response.body);
    return religion_display_model.fromJson(data);
  }
}

class maritalStatusDisplay {
  maritalStatusDisplay();
  Future<maritalstatus_display_model> maritalStatusDisplayList() async {
    var url = LURL + "/api/marital_status";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display marital_status" + response.body);
    return maritalstatus_display_model.fromJson(data);
  }
}

class communityDisplay {
  communityDisplay();
  Future<community_display_model> communityDisplayList(religionId) async {
    var url = LURL + "/api/community?religion_id=$religionId";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display community" + response.body);
    return community_display_model.fromJson(data);
  }
}

class multipleDisplay {
  multipleDisplay();
  Future<display_religion_marital_lang_model> displayList(
      {religionId = "62bd36505dbf71e2b67ba61b"}) async {
    var url = LURL + "/api/home_town/web?religion_id=$religionId";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        },
    );
    var data = json.decode(response.body);
    print("display 4 Details " + response.body);
    return display_religion_marital_lang_model.fromJson(data);
  }
}

class motherTongueDisplay {
  motherTongueDisplay();
  Future<mother_tongue_display_model> motherTongueDisplayList() async {
    var url = LURL + "/api/mother_tongue";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_mother_tongue" + response.body);
    return mother_tongue_display_model.fromJson(data);
  }
}

class settleDownDisplay {
  settleDownDisplay();
  Future<settledown_display_model> settleDownDisplayList() async {
    var url = LURL + "/api/settle_down_value";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_settle_down" + response.body);
    return settledown_display_model.fromJson(data);
  }
}

class foodPreferenceDisplay {
  foodPreferenceDisplay();
  Future<food_preference_display_model> foodPreferenceDisplayList() async {
    var url = LURL + "/api/food_preference";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_food_preference" + response.body);
    return food_preference_display_model.fromJson(data);
  }
}

class smokeDisplay {
  smokeDisplay();
  Future<smoke_display_model> smokeDisplayList() async {
    var url = LURL + "/api/smoke_status";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_smoke" + response.body);
    return smoke_display_model.fromJson(data);
  }
}

class drinkDisplay {
  drinkDisplay();
  Future<drink_display_model> drinkDisplayList() async {
    var url = LURL + "/api/drink_status";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_drink" + response.body);
    return drink_display_model.fromJson(data);
  }
}

class qualificationDisplay {
  qualificationDisplay();
  Future<qualification_display_model> qualificationDisplayList() async {
    var url = LURL + "/api/highest_qualification";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_qualification" + response.body);
    return qualification_display_model.fromJson(data);
  }
}

class collegeDisplay {
  collegeDisplay();
  Future<college_display_model> collegDisplayList() async {
    var url = LURL + "/api/college";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_college" + response.body);
    return college_display_model.fromJson(data);
  }
}

class jobTitleDisplay {
  jobTitleDisplay();
  Future<job_title_display_model> jobTitleDisplayList() async {
    var url = LURL + "/api/job_title";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_job_title" + response.body);
    return job_title_display_model.fromJson(data);
  }
}

class companyDisplay {
  companyDisplay();
  Future<company_display_model> companyDisplayList() async {
    var url = LURL + "/api/company_name";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_company" + response.body);
    return company_display_model.fromJson(data);
  }
}

class salaryDisplay {
  salaryDisplay();
  Future<salary_display_model> salaryDisplayList() async {
    var url = LURL + "/api/salary";

    //CODE TO BE CHANGED
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('user').toString();
    //-------------------------
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_salary" + response.body);
    return salary_display_model.fromJson(data);
  }
}

class membershipDisplay {
  membershipDisplay();
  Future<membership_display_model> membershipDisplayList() async {
    var url = LURL + "/api/membership_plan";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        // "Authorization":
        //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_membership" + response.body);
    return membership_display_model.fromJson(data);
  }
}

class membershipFeatureDisplay {
  membershipFeatureDisplay();
  Future<membership_feature_display_model>
      membershipFeatureDisplayList() async {
    var url = LURL + "/api/membership_feature";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        // "Authorization":
        //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjoxMjM0NTY3ODkwLCJpZCI6IjYyYzNlOTI4ZmFjODMzYmNkMGZkYzcxMyIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDU1ODczMCwiZXhwIjoxNjkyMDk0NzMwfQ.keDEsSAIVm0n-AC7_i_PTR2Gt0Jz-gerhiRf1Y9klJc"
      },
    );
    var data = json.decode(response.body);
    print("display_membership features" + response.body);
    return membership_feature_display_model.fromJson(data);
  }
}

class profilePicAdd {
  profilePicAdd();
  Future<add_profilepic_model> uploadImage(List<String>user_photo) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/user_photo";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers["Authorization"] = _prefs.getString('user').toString();
    // request.headers["Authorization"] =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjo5MTA2ODMyNzAxLCJpZCI6IjYyZjc5MWJlNDI3NzI1NjI5MTgzYTg1OSIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDkyOTg3OCwiZXhwIjoxNjkyNDY1ODc4fQ.ZF1KpwJc6KpmOVr_ZtJEQwSJq2WpyoNKKW6mLDJ7ZOo";
    // request.files
    //     .add(await http.MultipartFile.fromPath('user_photo', user_photo));
    // Add Every File to the Multipart Request
    for (var i = 0; i < user_photo.length; i++) {
      request.files.add(await http.MultipartFile.fromPath('user_photo', user_photo[i]));
    }
    var res = await request.send();
    var responseData = await res.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    print(result);
    var data = jsonDecode(result);
    return add_profilepic_model.fromJson(data);
  }
}

class profileAdd {
  profileAdd();
  Future<add_profile_model> profileList(
      email,
      age,
      gender,
      bio,
      marital_status,
      religion,
      mother_tongue,
      community,
      settle_down,
      home_town,
      height,
      highest_qualification,
      college,
      job_title,
      company_name,
      salary,
      food_preference,
      smoke,
      drink,
      user_name,
      status,
      member_type,
      membership_plan,
      membership_date,
      user_photo,
      country,
      weight,
      contact_no,
      dob,
      designation) async {
    var url = LURL + "/api/profile";
    // http.Response response = await http.post(Uri.parse(url),
    //     headers: {
    //       "content-type": "application/json",
    //       "Authorization":
    //           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjo5MTA2ODMyNzAxLCJpZCI6IjYyZjc5MWJlNDI3NzI1NjI5MTgzYTg1OSIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDkyOTg3OCwiZXhwIjoxNjkyNDY1ODc4fQ.ZF1KpwJc6KpmOVr_ZtJEQwSJq2WpyoNKKW6mLDJ7ZOo"
    //     },

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers["Authorization"] =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250YWN0X25vIjo5MTA2ODMyNzAxLCJpZCI6IjYyZjc5MWJlNDI3NzI1NjI5MTgzYTg1OSIsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTY2MDkyOTg3OCwiZXhwIjoxNjkyNDY1ODc4fQ.ZF1KpwJc6KpmOVr_ZtJEQwSJq2WpyoNKKW6mLDJ7ZOo";
    request.fields["email"] = email;
    request.fields["age"] = age;
    request.fields["gender"] = gender;
    request.fields["bio"] = bio;
    request.fields["marital_status"] = marital_status;
    request.fields["religion"] = religion;
    request.fields["mother_tongue"] = mother_tongue;
    request.fields["community"] = community;
    request.fields["settle_down"] = settle_down;
    request.fields["home_town"] = home_town;
    request.fields["height"] = height;
    request.fields["highest_qualification"] = highest_qualification;
    request.fields["college"] = college;
    request.fields["job_title"] = job_title;
    request.fields["company_name"] = company_name;
    request.fields["salary"] = salary;
    request.fields["food_preference"] = food_preference;
    request.fields["smoke"] = smoke;
    request.fields["drink"] = drink;
    request.fields["user_name"] = user_name;
    request.fields["status"] = status;
    request.fields["member_type"] = member_type;
    request.fields["membership_plan"] = membership_plan;
    request.fields["membership_date"] = membership_date;
    request.fields["country"] = country;
    request.fields["weight"] = weight;
    request.fields["contact_no"] = contact_no;
    request.fields["dob"] = dob;
    request.fields["designation"] = designation;

    user_photo!=""? request.files
        .add(await http.MultipartFile.fromPath("user_photo", user_photo)):null;
    var res = await request.send();
    var responseData = await res.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    // print(result);
    var data = jsonDecode(result);
    print("add_profile" + result);
    return add_profile_model.fromJson(data);
  }
}

class profileEdit {
  profileEdit();
  Future<edit_profile_model> profileEditList(
      user_name,
      age,
      dob,
      email,
      hometown,
      height,
      religion,
      highest_qualification,
      college,
      job_title,
      income,
      marital_status,
      company,
      bio,
      settle_down,
      community,
      mother_tongue,
      weight) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/profile";
    var request = http.MultipartRequest('PUT', Uri.parse(url));
    request.headers["Authorization"] = _prefs.getString("user")!;
    request.fields["email"] = email;
    request.fields["age"] = age;
    request.fields["bio"] = bio;
    request.fields["marital_status"] = marital_status;
    request.fields["religion"] = religion;
    request.fields["mother_tongue"] = mother_tongue;
    request.fields["community"] = community;
    request.fields["settle_down"] = settle_down;
    request.fields["home_town"] = hometown;
    request.fields["height"] = height;
    request.fields["highest_qualification"] = highest_qualification;
    request.fields["college"] = college;
    request.fields["job_title"] = job_title;
    request.fields["company_name"] = company;
    request.fields["salary"] = income;
    // request.fields["food_preference"] = food_preference;
    // request.fields["smoke"] = smoke;
    // request.fields["drink"] = drink;
    request.fields["user_name"] = user_name;
    // request.fields["status"] = status;
    // request.fields["member_type"] = member_type;
    // request.fields["membership_plan"] = membership_plan;
    // request.fields["membership_date"] = membership_date;
    // request.fields["country"] = country;
    request.fields["weight"] = weight;
    // request.fields["contact_no"] = contact_no;
    request.fields["dob"] = dob;

    // request.files
    //     .add(await http.MultipartFile.fromPath("user_photo", user_photo));
    var res = await request.send();
    var responseData = await res.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    // print(result);
    var data = jsonDecode(result);
    print("edit_profile" + result);
    return edit_profile_model.fromJson(data);
  }
}

class preferenceAdd {
  preferenceAdd();
  Future<add_partner_preference_model> prefList(
      {required String maritalstatus,
      required List<String> religion,
      required int min_age,
      required int max_age,
      required String annual_income,
      required String food_prefs,
      required String min_height,
      required String max_height,
      required List<String> language,
      required String drink,
      required String smoke,
      required String location}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/preference";
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization": _prefs.getString("user")!,
        },
        body: json.encode({
          "marital_status": maritalstatus,
          "religion": religion,
          "min_age": min_age,
          "max_age": max_age,
          "annual_income": annual_income,
          "food_preferences": food_prefs,
          "min_height": min_height,
          "max_height": max_height,
          "language": language,
          "location": location,
          "drink": drink,
          "smoke": smoke,
        }));

    var data = json.decode(response.body);
    print("Partner Preference Model : " + response.body);
    return add_partner_preference_model.fromJson(data);
  }
}

class partnerpreferenceDisplay {
  partnerpreferenceDisplay();
  Future<display_partner_preference_model> preferenceDisplayList() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/preference";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization": _prefs.getString("user")!,
      },
    );
    var data = json.decode(response.body);
    print("display partner preference : " + response.body);
    return display_partner_preference_model.fromJson(data);
  }
}

class partnerpreferenceUpdate {
  partnerpreferenceUpdate();
  Future<update_partner_preference_model> preferenceUpdateList(
      {required String maritalstatus,
      required List<String> religion,
      required int min_age,
      required int max_age,
      required String annual_income,
      required String food_prefs,
      required String min_height,
      required String max_height,
      required List<String> language,
      required String drink,
      required String smoke,
      required String location,
      required String id}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/preference?_id=$id";
    http.Response response = await http.put(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization": _prefs.getString("user")!,
        },
        body: json.encode({
          "marital_status": maritalstatus,
          "religion": religion,
          "min_age": min_age,
          "max_age": max_age,
          "annual_income": annual_income,
          "food_preferences": food_prefs,
          "min_height": min_height,
          "max_height": max_height,
          "language": language,
          "location": location,
          "drink": drink,
          "smoke": smoke,
        }));
    var data = json.decode(response.body);
    print("update partner preference : " + response.body);
    return update_partner_preference_model.fromJson(data);
  }
}

class familyAdd {
  familyAdd();
  Future<add_family_details_model> familyList(
      {required String father_occupation,
      required int no_of_brother,
      required int no_of_sister,
      required int no_of_married_brother,
      required int no_of_married_sister,
      required String mother_occupation}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/family";
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization": _prefs.getString("user")!,
        },
        body: json.encode({
          "father_occupation": father_occupation,
          "mother_occupation": mother_occupation,
          "no_of_brother": no_of_brother,
          "no_of_sister": no_of_sister,
          "no_of_married_brother": no_of_married_brother,
          "no_of_married_sister": no_of_married_sister
        }));

    var data = json.decode(response.body);
    print("Add Family Model : " + response.body);
    return add_family_details_model.fromJson(data);
  }
}

class familyDisplay {
  familyDisplay();
  Future<display_family_details_model> familyDisplayList() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/family";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization": _prefs.getString("user")!,
      },
    );
    var data = json.decode(response.body);
    print("display family details : " + response.body);
    return display_family_details_model.fromJson(data);
  }
}

class familyUpdate {
  familyUpdate();
  Future<update_family_details_model> familyUpdateList(
      {required String father_occupation,
      required int no_of_brother,
      required int no_of_sister,
      required int no_of_married_brother,
      required int no_of_married_sister,
      required String mother_occupation}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/family";
    http.Response response = await http.put(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization": _prefs.getString("user")!,
        },
        body: json.encode({
          "father_occupation": father_occupation,
          "mother_occupation": mother_occupation,
          "no_of_brother": no_of_brother,
          "no_of_sister": no_of_sister,
          "no_of_married_brother": no_of_married_brother,
          "no_of_married_sister": no_of_married_sister
        }));
    var data = json.decode(response.body);
    print("update family details : " + response.body);
    return update_family_details_model.fromJson(data);
  }
}

class userList {
  userList();
  Future<user_list_model> userLists() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/profile";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization": _prefs.getString("user")!,
      },
    );
    var data = json.decode(response.body);
    print("USER LIST details : " + response.body);
    return user_list_model.fromJson(data);
  }
}

class userDetail {
  userDetail();
  Future<user_details_model> userDetails(String? user_id) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/profile/userdetails?user_id=$user_id";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization": _prefs.getString("user")!,
      },
    );
    var data = json.decode(response.body);
    print("Another USer details called : " + response.body);
    return user_details_model.fromJson(data);
  }
}

class sendRequest {
  sendRequest();
  Future<send_request_model> requestAdd({required String receiver_id}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/request";
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization": _prefs.getString("user")!,
        },
        body: json.encode({
          "receiver_id": receiver_id,
          "request_status": "pending",
          "request_type": "request"
        }));

    var data = json.decode(response.body);
    print("Send Request Model : " + response.body);
    return send_request_model.fromJson(data);
  }
}

class acceptRequest {
  acceptRequest();
  Future<update_request_model> requestUpdate(
      {required String request_id}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/request?_id=${request_id}";
    http.Response response = await http.put(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization": _prefs.getString("user")!,
        },
        body: json.encode({
          // "receiver_id":receiver_id,
          "request_status": "confirm",
          // "request_type":"request"
        }));

    var data = json.decode(response.body);
    print("Accept Request Model : " + response.body);
    return update_request_model.fromJson(data);
  }
}

class rejectRequest {
  rejectRequest();
  Future<update_request_model> requestAdd({required String request_id}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/request?_id=${request_id}";
    http.Response response = await http.put(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization": _prefs.getString("user")!,
        },
        body: json.encode({
          // "receiver_id":"",
          "request_status": "cancel",
          "request_type": "request"
        }));

    var data = json.decode(response.body);
    print("Reject Update Request Model : " + response.body);
    return update_request_model.fromJson(data);
  }
}

class receivedRequest {
  receivedRequest();
  Future<display_request_model> userDetails() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/request/pending";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization": _prefs.getString("user")!,
      },
    );
    var data = json.decode(response.body);
    print("Received Request called : " + response.body);
    return display_request_model.fromJson(data);
  }
}

class confirmedRequest {
  confirmedRequest();
  Future<accepted_request_model> reqlist() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/request/confirm";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization": _prefs.getString("user")!,
      },
    );
    var data = json.decode(response.body);
    print("Accepted Request called : " + response.body);
    return accepted_request_model.fromJson(data);
  }
}

class blockUser {
  blockUser();
  Future<block_user_model> blockList({required String block_id}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/blockuser";
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization": _prefs.getString("user")!,
        },
        body: json.encode({"block_id": block_id}));

    var data = json.decode(response.body);
    print("User Block Model : " + response.body);
    return block_user_model.fromJson(data);
  }
}

class unblockUser {
  unblockUser();
  Future<unblock_user_model> unblockList({required String block_id}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print("IN UNBLOCK USER API " + block_id);
    var url = LURL + "/api/blockuser?_id=${block_id}";
    http.Response response = await http.delete(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization": _prefs.getString("user")!,
      },
    );
    var data = json.decode(response.body);
    print("User Unblock Model : " + response.body);
    return unblock_user_model.fromJson(data);
  }
}

class displayBlockUsers {
  displayBlockUsers();
  Future<display_block_user_model> blockList() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/blockuser";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "Authorization": _prefs.getString("user")!,
      },
    );
    var data = json.decode(response.body);
    print("Display Block called : " + response.body);
    return display_block_user_model.fromJson(data);
  }
}

class getContact {
  getContact();
  Future<count_contact_model> get(profile_id) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/count_of_contact_details";
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization": _prefs.getString("user")!,
        },
        body: json.encode({"profile_id": profile_id}));
    var data = json.decode(response.body);
    print("Count Contact Model : " + response.body);
    return count_contact_model.fromJson(data);
  }
}

//Api for getting faq list
class getFAQs{
  getFAQs();
  Future<display_faq_model> get() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var url = LURL + "/api/FAQS";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "content-type": "application/json",
        }
    );
    var data = json.decode(response.body);
    print("Display FAQ called : " + response.body);
    return display_faq_model.fromJson(data);
}}
