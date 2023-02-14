import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/mother_tongue_display_model.dart';
import 'package:matrimonial_app/model/settle_down_display_model.dart';
import 'package:matrimonial_app/utils/textfield_validators.dart';

import 'package:matrimonial_app/widgets/drop_down_widget.dart';

import '../../model/display_religion_marital_lang_model.dart';
import '../../utils/routes.dart';
import '../gradient_button.dart';
import '../../main_screens/diet_screen.dart';

class LanguageWidget extends StatefulWidget {
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
  final String dob;
  final int weight;

  LanguageWidget({
    Key? key,
    required this.country,
    required this.homeTown,
    required this.height,
    required this.religion,
    required this.maritalstatus,
    required this.community,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.gender, required this.dob, required this.weight,
  }) : super(key: key);

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  // mother_tongue_display_model languageData = mother_tongue_display_model();
  // settledown_display_model settleDownData = settledown_display_model();
  // List<String> nativeLanguage = [];
  display_religion_marital_lang_model multiData = display_religion_marital_lang_model();
  List<String>? nativeLanguage;
  // = ["hindi", "marathi", "bengali", "telugu", "tamil", "kannada", "malayalam", "gujarati", "punjabi", "odia", "urdu", "assamese", "maithili", "bhilli", "santali", "kashmiri", "nepali", "gondi", "sindhi", "konkani", "english", "marwari", "other", "any"];
  List<String>? settleDownTimeSpan;
  // = ["6 months", "in a year", "1-2 years", "2+ years"];
  // List<String> settleDownTimeSpan = [];
  String? nativeSelectedValue;
  String? timeSpanSelectedValue;

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
    multiData = await multipleDisplay().displayList();
    nativeLanguage = multiData.data!.motherTongue?.map((item) => item.mtName!).toList() ?? [];
    settleDownTimeSpan = multiData.data!.settleDown?.map((item) => item.settleDownValue!).toList() ?? [];
    // languageData = await motherTongueDisplay().motherTongueDisplayList();
    setState(() {});
    // nativeLanguage = languageData.data!.map((item) => item.mtName!).toList();
    //
    // settleDownData = await settleDownDisplay().settleDownDisplayList();
    // settleDownTimeSpan =
    //     settleDownData.data!.map((item) => item.settleDownValue!).toList();
    // print(nativeLanguage);
    // print(settleDownTimeSpan);
  }

  @override
  Widget build(BuildContext context) {
    print("height: " + widget.height);
    print("homeTown: " + widget.homeTown);
    print("country: " + widget.country);
    print("religion: " + widget.religion);
    print("maritalstatus: " + widget.maritalstatus);
    print("community: " + widget.community);
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
              SizedBox(
                height: 100.h,
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
                    "Select Your Mother tongue",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  isExpanded: true,
                  items: nativeLanguage
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
                      nativeSelectedValue = value;
                    });
                  },
                  value: nativeSelectedValue,
                ),
              ),
              // DropDownWidget(
              //   items: nativeLanguage,
              //   hintText: "Mother tongue",
              //   selectedValue: nativeSelectedValue,
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
                    "Select time to Settle down",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  isExpanded: true,
                  items: settleDownTimeSpan
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
                      timeSpanSelectedValue = value;
                    });
                  },
                  value: timeSpanSelectedValue,
                ),
              ),
              // DropDownWidget(
              //   items: timeSpan,
              //   hintText: "Settle down",
              //   selectedValue: timeSpanSelectedValue,
              // ),
              screenHeight < 800
                  ? SizedBox(
                      height: 100.h,
                    )
                  : SizedBox(
                      height: 128.h,
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
                          if(validateDropdown([nativeSelectedValue.toString(),timeSpanSelectedValue.toString()], context))
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DietScreen(
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
                                  nativeLanguage: nativeSelectedValue ?? "",
                                  settleDownTime:
                                      timeSpanSelectedValue ?? "", dob: widget.dob, weight: widget.weight,)));
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
