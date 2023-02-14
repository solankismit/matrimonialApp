import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/hometown_display_model.dart';
import 'package:matrimonial_app/utils/textfield_validators.dart';
import 'package:matrimonial_app/widgets/drop_down_widget.dart';
import 'package:matrimonial_app/widgets/dropdown_widgets/status_widget.dart';

import '../../model/display_country_state_city_model.dart';
import '../../utils/routes.dart';
import '../gradient_button.dart';
//TODO: Get Country City name from free API
class HomeTownScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String age;
  final String gender;
  final String height;
  final String dob;
  final int weight;

  const HomeTownScreen({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.gender,
    required this.height, required this.dob, required this.weight,
  }) : super(key: key);

  @override
  State<HomeTownScreen> createState() => _HomeTownScreenState();
}

class _HomeTownScreenState extends State<HomeTownScreen> {

  display_country_state_city_model statedata = display_country_state_city_model();
  // hometown_display_model countrydata = hometown_display_model();
  // hometown_display_model statedata = hometown_display_model();
  // hometown_display_model citydata = hometown_display_model();
  List<String> stateList = [];
  List<String>? CountryList = [];
  List<String> CityList = [];
  // "Andhra Pradesh",

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  String? townSelectedValue;
  String? stateSelectedValue;
  String? countrySelectedValue;

  Future<bool> loadData() async {
    print(statedata.toString() + ">>>>>>>>>>>>>>>");
    statedata = await countryDisplay().homeTownDisplayList();
    // statedata = await homeTownDisplay().homeTownDisplayList();
    // print(statedata.names?[0].name?.toString());
    CountryList = statedata.data?.map(
          (item) {
        return item.name?.toString() ?? "";
      },
    ).toList();
    setState(() {});
    return true;
  }
  void getStateData() {
    //check if the country is selected or not
    if (countrySelectedValue != null) {
      //if country is selected then get the state list
      stateList = statedata.data
          ?.where((element) => element.name == countrySelectedValue)
          .first
          .states
          ?.map((e) => e.name ?? "")
          .toList() ?? [];
    }
    setState(() {});
  }
    void getCityData(){
    if(stateSelectedValue != null){
      //if state is selected then get the city list
      CityList = statedata.data?.where((element) => element.name == countrySelectedValue).first.states?.where((element) => element.name == stateSelectedValue).first.cities?.map((e) => e.name ?? "").toList() ?? [];
    }
    print(CountryList);
    setState(() {});
  }

  // final List<String> state = [
  //   "Andhra Pradesh",
  //   // "Arunachal Pradesh",
  //   // "Assam",
  //   // "Bihar",
  //   // "Chhattisgarh",
  //   // "Goa",
  //   // "Gujarat",
  //   // "Haryana",
  //   // "Himachal Pradesh",
  //   // "Jammu and Kashmir",
  //   // "Jharkhand",
  //   // "Karnataka",
  //   // "Kerala",
  //   // "Madhya Pradesh",
  //   // "Maharashtra",
  //   // "Manipur",
  //   // "Meghalaya",
  //   // "Mizoram",
  //   // "Nagaland",
  //   // "Odisha",
  //   // "Punjab",
  //   // "Rajasthan",
  //   // "Sikkim",
  //   // "Tamil Nadu",
  //   // "Telangana",
  //   // "Tripura",
  //   // "Uttarakhand",
  //   // "Uttar Pradesh",
  //   // "West Bengal",
  //   // "Andaman and Nicobar Islands",
  //   // "Chandigarh",
  //   // "Dadra and Nagar Haveli",
  //   // "Daman and Diu",
  //   // "Delhi",
  //   // "Lakshadweep",
  //   // "Puducherry"
  // ];

  // List<String> country = ["India", "Australia", "New Zealand", "England"];


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      // resizeToAvoidBottomInset: false,
      body: FutureBuilder<bool>(
        future: loadData(),
        builder: (context, snapshot) {
          return snapshot.hasData ? SingleChildScrollView(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        child: Text(
                          "Home Town",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: Colors.black),
                        ),
                      ),
                      screenHeight < 800
                          ? SizedBox(
                              height: 50.h,
                            )
                          : SizedBox(
                              height: 90.h,
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
                            "Select your country",
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          isExpanded: true,
                          // items: country
                          items: CountryList
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
                              countrySelectedValue = value;
                              getStateData();
                            });
                          },
                          value: countrySelectedValue,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
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
                            "Select Your State",
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          isExpanded: true,
                          items: stateList
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
                              stateSelectedValue = value;
                              getCityData();
                            });
                          },
                          value: stateSelectedValue,
                        ),
                      ),SizedBox(
                        height: 20.h,
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
                            "Select Your City",
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          isExpanded: true,
                          items: CityList
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
                              townSelectedValue = value;
                            });
                          },
                          value: townSelectedValue,
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
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
                              print(townSelectedValue.toString());
                              print(countrySelectedValue.toString());
                              if(validateDropdown([countrySelectedValue.toString(),townSelectedValue.toString()], context)) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => statusScreen(
                                          email: widget.email,
                                          firstName: widget.firstName,
                                          lastName: widget.lastName,
                                          phoneNumber: widget.phoneNumber,
                                          gender: widget.gender,
                                          age: widget.age,
                                          country: countrySelectedValue,
                                          homeTown: townSelectedValue,
                                          height: widget.height,
                                          dob: widget.dob,
                                          weight: widget.weight,
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
          ) : Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }
}
