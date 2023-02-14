import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/company_display_model.dart';
import 'package:matrimonial_app/model/job_title_display_model.dart';
import 'package:matrimonial_app/model/salary_display_model.dart';
import 'package:matrimonial_app/utils/textfield_validators.dart';
import 'package:matrimonial_app/widgets/drop_down_widget.dart';

import '../../utils/routes.dart';
import '../gradient_button.dart';
import 'bio_widget.dart';

class OccupationWidget extends StatefulWidget {
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
  final String heighestQualification;
  final String college;
  final String dob;
  final int weight;

  final String designation;

  OccupationWidget({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.gender,
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
    required this.heighestQualification,
    required this.college,
    required this.dob,
    required this.weight, required this.designation,
  }) : super(key: key);

  @override
  State<OccupationWidget> createState() => _OccupationWidgetState();
}

class _OccupationWidgetState extends State<OccupationWidget> {
  job_title_display_model jobTitleData = job_title_display_model();
  // company_display_model companyData = company_display_model();
  salary_display_model salaryData = salary_display_model();
  List<String> jobTitleList = [];
  // List<String> companyNameList = [];
  List<String> salaryList = [];

  String? jobSelectedValue;
  String? companySelectedValue;
  String? salarySelectedValue;

  TextEditingController companyNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    jobTitleData = await jobTitleDisplay().jobTitleDisplayList();
    // companyData = await companyDisplay().companyDisplayList();
    salaryData = await salaryDisplay().salaryDisplayList();
    setState(() {});
    jobTitleList = jobTitleData.data!.map((item) => item.jtName!).toList();
    // companyNameList = companyData.data!.map((item) => item.cnName!).toList();
    salaryList = salaryData.data!.map((item) => item.salaryValue!).toList();
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
              SizedBox(
                height: 40.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Occupation Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Colors.black),
                ),
              ),
              screenHeight < 800
                  ? SizedBox(
                      height: 20.h,
                    )
                  : SizedBox(
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
                    "Select Your Job Title",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  isExpanded: true,
                  items: jobTitleList
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
                      jobSelectedValue = value;
                    });
                  },
                  value: jobSelectedValue,
                ),
              ),
              // DropDownWidget(
              //   items: jobTitle,
              //   selectedValue: jobSelectedValue,
              //   hintText: "Job Title",
              // ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: companyNameController,
                  decoration: InputDecoration(hintText: "Company Name"),
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                  // underline: Container(
                  //   height: 2,
                  //   color: Color(0xfffeadad),
                  // ),
                  // hint: Text(
                  //   // widget.hintText,
                  //   "Select Your Company Name",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     color: Theme.of(context).hintColor,
                  //   ),
                  // ),
                  // isExpanded: true,
                  // items: companyNameList
                  //     .map((item) => DropdownMenuItem<String>(
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
                  // onChanged: (String? value) {
                  //   setState(() {
                  //     companySelectedValue = value;
                  //   });
                  // },

                  // value: companySelectedValue,
                ),
              ),
              // DropDownWidget(
              //   items: companyName,
              //   selectedValue: companySelectedValue,
              //   hintText: "Company Name",
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
                    "Select Your Salary Range",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  isExpanded: true,
                  items: salaryList
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
                      salarySelectedValue = value;
                    });
                  },
                  value: salarySelectedValue,
                ),
              ),
              // DropDownWidget(
              //   items: Salary,
              //   selectedValue: salarySelectedValue,
              //   hintText: "Salary",
              // ),
              // Center(
              //   child: dropDown("Salary", context, Salary, salarySelectedValue),
              // ),
              screenHeight < 800
                  ? SizedBox(
                      height: 16.h,
                    )
                  : SizedBox(
                      height: 50.h,
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
                            jobSelectedValue.toString(),
                            companyNameController.text.toString(),
                            salarySelectedValue.toString()
                          ], context)) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BioWidget(
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
                                          widget.heighestQualification,
                                      college: widget.college,
                                      jobTitle: jobSelectedValue ?? "",
                                      companyName: companyNameController.text.toString() ,
                                      salary: salarySelectedValue ?? "",
                                      dob: widget.dob,
                                      weight: widget.weight,
                                  designation : widget.designation
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
