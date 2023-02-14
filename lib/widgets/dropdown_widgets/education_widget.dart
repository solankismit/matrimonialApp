import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/college_display_model.dart';
import 'package:matrimonial_app/model/qualification_display_model.dart';
import 'package:matrimonial_app/utils/textfield_validators.dart';
import 'package:matrimonial_app/widgets/drop_down_widget.dart';

import '../../utils/routes.dart';
import '../gradient_button.dart';
import 'occupation_widget.dart';

class EducationWidget extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String age;
  final String gender;
  final String country;
  final String homeTown;
  final String height;
  final String religion;
  final String maritalstatus;
  final String community;
  final String nativeLanguage;
  final String settleDownTime;
  final String foodpreference;
  final String smokeStatus;
  final String drinkStatus;
  final String dob;
  final int weight;

  EducationWidget({
    Key? key,
    required this.country,
    required this.homeTown,
    required this.height,
    required this.religion,
    required this.maritalstatus,
    required this.community,
    required this.nativeLanguage,
    required this.settleDownTime,
    required this.foodpreference,
    required this.smokeStatus,
    required this.drinkStatus,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.gender,
    required this.dob,
    required this.weight,
  }) : super(key: key);

  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
  qualification_display_model qualificationData = qualification_display_model();
  college_display_model collegeData = college_display_model();
  List<String> qualificationList = [];
  List<String> collegeList = [];

  String? qualificationSelectedValue;
  String? collegeSelectedValue;

  TextEditingController _designation = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    qualificationData = await qualificationDisplay().qualificationDisplayList();
    collegeData = await collegeDisplay().collegDisplayList();
    setState(() {});
    qualificationList =
        qualificationData.data!.map((item) => item.hqName!).toList();
    collegeList = collegeData.data!.map((item) => item.clgName!).toList();
  }

  @override
  Widget build(BuildContext context) {
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
                    setState(() {
                      Navigator.of(context).pop();
                    });
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Education Detail",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DropdownButton(
                      underline: Container(
                        height: 2,
                        color: Color(0xfffeadad),
                      ),
                      hint: Text(
                        // widget.hintText,
                        "Select Your Highest Qualification",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      isExpanded: true,
                      items: qualificationList
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
                          qualificationSelectedValue = value;
                        });
                      },
                      value: qualificationSelectedValue,
                    ),
                  ),
                  // DropDownWidget(
                  //   items: highestQualification,
                  //   hintText: "Highest Qualification",
                  //   selectedValue: qualificationSelectedValue,
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
                        // widget.hintText,
                        "Select Your College",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      isExpanded: true,
                      items: collegeList
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
                          collegeSelectedValue = value;
                        });
                      },
                      value: collegeSelectedValue,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                        controller: _designation,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                        // maxLines: 6,
                        decoration: InputDecoration(
                          hintText: "Designation",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfffeadad)),
                            ),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent)),)),
                  ),
                  // DropDownWidget(
                  //   items: college,
                  //   hintText: "College",
                  //   selectedValue: collegeSelectedValue,
                  // ),
                  screenHeight < 800
                      ? SizedBox(
                          height: 80.h,
                        )
                      : SizedBox(
                          height: 120.h,
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
                        setState(() {
                          if (validateDropdown([
                            qualificationSelectedValue.toString(),
                            collegeSelectedValue.toString(),
                          ], context) && validateEmptyField([_designation], context)) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OccupationWidget(
                                      email: widget.email,
                                      firstName: widget.firstName,
                                      lastName: widget.lastName,
                                      phoneNumber: widget.phoneNumber,
                                      gender: widget.gender,
                                      age: widget.age,
                                      height: widget.height,
                                      homeTown: widget.homeTown,
                                      country: widget.country,
                                      religion: widget.religion,
                                      maritalstatus: widget.maritalstatus,
                                      community: widget.community,
                                      nativeLanguage: widget.nativeLanguage,
                                      settleDownTime: widget.settleDownTime,
                                      foodpreference: widget.foodpreference,
                                      smokeStatus: widget.smokeStatus,
                                      drinkStatus: widget.drinkStatus,
                                      heighestQualification:
                                          qualificationSelectedValue ?? "",
                                      college: collegeSelectedValue ?? "",
                                      dob: widget.dob,
                                      weight: widget.weight,
                                  designation : _designation.text ?? ""
                                    )));
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
