import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/community_display_model.dart';
import 'package:matrimonial_app/model/display_religion_marital_lang_model.dart';
import 'package:matrimonial_app/model/maritalstatus_display_model.dart';
import 'package:matrimonial_app/model/religion_display_model.dart';
import 'package:matrimonial_app/utils/textfield_validators.dart';
import 'package:matrimonial_app/widgets/drop_down_widget.dart';
import 'package:matrimonial_app/widgets/dropdown_widgets/language_widget.dart';

import '../../utils/routes.dart';
import '../gradient_button.dart';
//TODO: Enter Static Data in all the field
class statusScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String age;
  final String gender;
  String? country = "";
  String? homeTown = "";
  final String height;
  final String dob;
  final int weight;

  statusScreen({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.gender,
    this.country,
    this.homeTown,
    required this.height, required this.dob, required this.weight,
  }) : super(key: key);

  @override
  State<statusScreen> createState() => _statusScreenState();
}

class _statusScreenState extends State<statusScreen> {
  // religion_display_model religionData = religion_display_model();
  // maritalstatus_display_model statusData = maritalstatus_display_model();
  // community_display_model communityData = community_display_model();

  display_religion_marital_lang_model multiData = display_religion_marital_lang_model();
  // display_religion_marital_lang_model communityData = display_religion_marital_lang_model();
  Map<String,String>? religionList;
  // = ["hindu", "muslim", "christian", "sikh", "buddhist", "jain", "parsis", "others"];
  Map<String,List<String>>? communityData;
  // = {
  //   "hindu" : ["brahmin", "kshatriya", "vaishya", "shudra", "others"],
  //   "muslim" : ["bangali", "bohra", "khoja", "mapila", "memon", "rajput", "shafi", "shia", "sunni", "other"],
  //   "christian" : ["anglo","born again", "catholic","cni","csi","jacobite","pentecost", "marthoma","baptist","adventist","protestant","presbyterian","orthodox","methodist","brethren"],
  //   "sikh" : [ "arora","shaven","gursikh","jat","kamboj","ramgharia","ramdasia","others"],
  //   "buddhist" : ["others"],
  //   "jain" : ["digambar","shwetamber","vania","other"],
  //   "parsis" : ["others"],
  //   "others" : ["others"]
  // };
  String religionId = "";
  // List<String> statusList = ["Divorced", "Widowed", "Awaiting divorce", "never married"];
  List<String>? statusList = [];

  List communityList = [];
  // List<String> communityList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void loadData() async {
    religionList = {};
    multiData = await multipleDisplay().displayList();
    statusList = multiData.data!.maritalStatus!.map((item) => item.status!).toList();
    //Create Map of Religionid and name in multiData
   multiData.data!.religion!.map((item) => MapEntry(item.sId!,item.religiousName!)).every((element) {
      religionList?[element.key] = element.value;
      print(element.key);
      print(element.value);
      print(religionList);
      return true;
    },);
    // communityData = multiData.data!.community!.map((item) => item.communityName!).toList();
    print(religionList);
    print(statusList);
    setState(() {});
    // religionData = await religionDisplay().religionDisplayList();
    // statusData = await maritalStatusDisplay().maritalStatusDisplayList();
    // setState(() {});
    //religion
    // religionList = religionData.data!.map(
    //   (item) {
    //     return item.religiousName!;
    //   },
    // ).toList();
    //marital status
    // statusList = statusData.data!.map((item) => item.status!).toList();
  }

  void loadCommunityData(String relId) async {

    multiData = await multipleDisplay().displayList(religionId: relId);
    communityList = multiData.data!.community!.map((item) => item.communityName!).toList();
    setState(() {});
    //Old Code with API Call
    // religionId = religionData.data![index].sId.toString();
    // print(index);
    //community

    // communityData = await communityDisplay().communityDisplayList(religionId);
    // int index1 = communityData.data!.indexWhere(
    //   (element) => element.religiousName == religionSelectedValue,
    // );
    // communityList = communityData.data![index1].communities!
    //     .map(
    //       (e) => e.communityName!,
    //     )
    //     .toList();


    //New Code with Static Data
    // communityList = communityData[religionSelectedValue]!;
    // setState(() {});
    // // print(communityList);
    // for(int i=0;i<communityList.length;i++){
    //   print(r'"' + communityList[i]+r'",');
    // }

    // print("-------------->" + communityData.data![index1].communities![0].communityName.toString());
    // communityList = communityData.data!.map((item) {
    //   return item.communities!;
    // }).toList();

    // communityList = communityData.data![index].communities!.map((item) {
    //   return item.communityName!;
    // }).toList();
  }

  // List<String> religion = ["Hinduism", "Muslim", "Christain"];
  // List<String> status = ["Single", "Married", "Divorced", "Widowed"];
  // List<String> communityDemo = ["Ahir", "Kshatriya", "Patel"];
  String? religionSelectedValue;
  String? religionSelectedId;
  String? statusSelectedValue;
  String? communitySelectedValue;
  @override
  Widget build(BuildContext context) {
    print(widget.homeTown);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg1.png"), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
              ),
              Container(
                // width: double.infinity,
                margin: EdgeInsets.only(left: 20.w),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(height: 210.h),

              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 10.w),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Find precisely \nthe right character for you",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kristi(
                        textStyle: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3),
                      )),
                ),
              ),
              // SizedBox(
              //   height: 15.h,
              // ),
              Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DropdownButton(
                      underline: Container(
                        height: 2,
                        color: Color(0xfffeadad),
                      ),
                      hint: Text(
                        "Select Your Religion",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      isExpanded: true,

                      // items: religionList
                      //     ?.map((item) => DropdownMenuItem<String>(
                      //           value: item,
                      //           child: Column(
                      //             children: [
                      //               Text(
                      //                 item,
                      //                 style: const TextStyle(
                      //                   fontSize: 14,
                      //                 ),
                      //               ),
                      //               // Divider()
                      //             ],
                      //           ),
                      //         ))
                      //     .toList(),
                      items: religionList?.values.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Column(
                            children: [
                              Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              // Divider()
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          religionSelectedValue = value;
                          religionSelectedId = religionList?.keys
                              .firstWhere((k) => religionList![k] == value);
                          loadCommunityData(religionSelectedId!);
                        });
                      },
                      value: religionSelectedValue,
                    ),
                  ),
                  // DropDownWidget(
                  //   items: ,
                  //   hintText: "Religion",
                  //   selectedValue: religionSelectedValue,
                  // ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DropdownButton(
                      underline: Container(
                        height: 2,
                        color: Color(0xfffeadad),
                      ),
                      hint: Text(
                        "Select Your Marital Status",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      isExpanded: true,
                      items: statusList
                          ?.map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Column(
                                  children: [
                                    Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    // Divider()
                                  ],
                                ),
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          statusSelectedValue = value;
                        });
                      },
                      value: statusSelectedValue,
                    ),
                  ),
                  // DropDownWidget(
                  //   items: status,
                  //   hintText: "Marital Status",
                  //   selectedValue: statusSelectedValue,
                  // ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DropdownButton(
                      underline: Container(
                        height: 2,
                        color: Color(0xfffeadad),
                      ),
                      hint: Text(
                        "Select Your Community",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      isExpanded: true,
                      items: communityList
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Column(
                                  children: [
                                    Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    // Divider()
                                  ],
                                ),
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          communitySelectedValue = value;
                        });
                      },
                      value: communitySelectedValue,
                    ),
                  ),
                  // DropDownWidget(
                  //   items: community,
                  //   hintText: "Community",
                  //   selectedValue: communitySelectedValue,
                  // ),
                  screenHeight < 800
                      ? SizedBox(
                          height: 60.h,
                        )
                      : SizedBox(
                          height: 100.h,
                        ),
                ],
              ),
              Center(
                  child: GradientButton(
                      width: 340.w,
                      height: 50.h,
                      color1: Color(0xfffd7a8f),
                      color2: Color(0xfff653e1),
                      text: "Save",
                      onPressed: () {
                        print(religionSelectedValue.toString() +
                            " " +
                            statusSelectedValue.toString() +
                            " " +
                            communitySelectedValue.toString());
                        setState(() {
                          if(validateDropdown([religionSelectedValue.toString(),statusSelectedValue.toString(),communitySelectedValue.toString()], context)) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => LanguageWidget(
                                      email: widget.email,
                                      firstName: widget.firstName,
                                      lastName: widget.lastName,
                                      phoneNumber: widget.phoneNumber,
                                      gender: widget.gender,
                                      age: widget.age,
                                      height: widget.height,
                                      country: widget.country ?? "",
                                      homeTown: widget.homeTown ?? "",
                                      religion: religionSelectedValue ?? "",
                                      maritalstatus: statusSelectedValue ?? "",
                                      community: communitySelectedValue ?? "",
                                      dob: widget.dob,
                                      weight: widget.weight,
                                    ))));
                          }
                        });
                      })),
              // SizedBox(
              //   height: 19.h,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
