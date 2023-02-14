import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/drink_display_model.dart';
import 'package:matrimonial_app/model/food_preference_display_model.dart';
import 'package:matrimonial_app/model/smoke_display_model.dart';
import 'package:matrimonial_app/utils/textfield_validators.dart';

import 'package:matrimonial_app/widgets/drop_down_widget.dart';

import '../utils/routes.dart';
import '../widgets/gradient_button.dart';
import '../widgets/dropdown_widgets/education_widget.dart';

class DietScreen extends StatefulWidget {
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
  final String dob;
  final int weight;

  DietScreen({
    Key? key,
    required this.country,
    required this.homeTown,
    required this.height,
    required this.religion,
    required this.maritalstatus,
    required this.community,
    required this.nativeLanguage,
    required this.settleDownTime,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.gender, required this.dob, required this.weight,
  }) : super(key: key);

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  food_preference_display_model foodpreferenceData = food_preference_display_model();
  smoke_display_model smokeData = smoke_display_model();
  drink_display_model drinkData = drink_display_model();
  List<String> foodPreferenceList = [];
  List<String> smokeList = [];
  List<String> drinkList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void loadData() async {
    foodpreferenceData = await foodPreferenceDisplay().foodPreferenceDisplayList();
    smokeData = await smokeDisplay().smokeDisplayList();
    drinkData = await drinkDisplay().drinkDisplayList();
    setState(() {});
    foodPreferenceList =
        foodpreferenceData.data!.map((item) => item.fpName!).toList();

    smokeList = smokeData.data!.map((item) => item.smokeValue!).toList();

    drinkList = drinkData.data!.map((item) => item.drinkValue!).toList();
  }

  String? foodSelectedValue;
  String? smokeSelectedValue;
  String? drinkSelectedValue;
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
                  "Diet Preference",
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
                    "Select Your Food Preference",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  isExpanded: true,
                  items: foodPreferenceList
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
                      foodSelectedValue = value;
                    });
                  },
                  value: foodSelectedValue,
                ),
              ),
              // DropDownWidget(
              //   items: foodPreference,
              //   hintText: "Food Preference",
              //   selectedValue: foodSelectedValue,
              // ),
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
                    "Smoke",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  isExpanded: true,
                  items: smokeList
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
                      smokeSelectedValue = value;
                    });
                  },
                  value: smokeSelectedValue,
                ),
              ),
              // DropDownWidget(
              //   items: smoke,
              //   hintText: "Smoke",
              //   selectedValue: smokeSelectedValue,
              // ),
              screenHeight < 800
                  ? SizedBox(
                      height: 10.h,
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
                    "Drink",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  isExpanded: true,
                  items: drinkList
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
                      drinkSelectedValue = value;
                    });
                  },
                  value: drinkSelectedValue,
                ),
              ),
              // DropDownWidget(
              //   items: drinkList,
              //   hintText: "Drink",
              //   selectedValue: drinkSelectedValue,
              // ),
              screenHeight < 800
                  ? SizedBox(
                      height: 25.h,
                    )
                  : SizedBox(
                      height: 40.h,
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
                          if(validateDropdown([foodSelectedValue.toString(),smokeSelectedValue.toString(),drinkSelectedValue.toString()], context))
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EducationWidget(
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
                                    foodpreference: foodSelectedValue ?? "",
                                    smokeStatus: smokeSelectedValue ?? "",
                                    drinkStatus: drinkSelectedValue ?? "", dob: widget.dob, weight: widget.weight,
                                  )));
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
