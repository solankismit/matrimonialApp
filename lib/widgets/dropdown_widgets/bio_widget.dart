import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:matrimonial_app/main_screens/profile_pic_screen.dart';
import 'package:matrimonial_app/utils/textfield_validators.dart';

import '../../utils/routes.dart';
import '../gradient_button.dart';

class BioWidget extends StatefulWidget {
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
  final String jobTitle;
  final String companyName;
  final String salary;
  final String dob;
  final int weight;

  final String designation;

  BioWidget({
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
    required this.jobTitle,
    required this.companyName,
    required this.salary, required this.dob, required this.weight, required String this.designation,

  }) : super(key: key);

  @override
  State<BioWidget> createState() => _BioWidgetState();
}

class _BioWidgetState extends State<BioWidget> {
  TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("height: " + widget.height);
    print("homeTown: " + widget.homeTown);
    print("country: " + widget.country);
    print("religion: " + widget.religion);
    print("maritalstatus: " + widget.maritalstatus);
    print("community: " + widget.community);
    print("nativeLanguage: " + widget.nativeLanguage);
    print("settleDownTime: " + widget.settleDownTime);
    print("foodpreference: " + widget.foodpreference);
    print("smokeStatus: " + widget.smokeStatus);
    print("drinkStatus: " + widget.drinkStatus);
    print("companyName: " + widget.companyName);
    print("salary: " + widget.salary);
    print("jobTitle: " + widget.jobTitle);

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
              screenHeight < 800
                  ? SizedBox(
                      height: 20.h,
                    )
                  : SizedBox(
                      height: 40.h,
                    ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Bio",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  "About You",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Colors.black45),
                ),
              ),
              screenHeight < 800
                  ? SizedBox(
                      height: 10.h,
                    )
                  : SizedBox(
                      height: 20.h,
                    ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                    controller: bioController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.black12),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.black12),
                          borderRadius: BorderRadius.circular(15),
                        ))),
              ),
              screenHeight < 800
                  ? SizedBox(
                      height: 16.h,
                    )
                  : SizedBox(
                      height: 30.h,
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
                          if(validateEmptyField([bioController], context) && validateBio(bioController.text, context)) {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfilePicker(
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
                                    jobTitle: widget.jobTitle,
                                    companyName: widget.companyName,
                                    salary: widget.salary,
                                    bio: bioController.text, dob: widget.dob, weight: widget.weight,
                                designation: widget.designation
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
