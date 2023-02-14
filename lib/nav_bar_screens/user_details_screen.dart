import 'dart:core';

import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconify_flutter/icons/akar_icons.dart';
import 'package:intl/intl.dart';
import 'package:matrimonial_app/main_screens/dashboard_screen.dart';
import 'package:matrimonial_app/menu_screens.dart/membership/membership_screen.dart';
import 'package:matrimonial_app/model/block_user_model.dart';
import 'package:matrimonial_app/model/count_contact_model.dart';
import 'package:matrimonial_app/model/edit_profile_model.dart';
import 'package:matrimonial_app/model/user_details_model.dart';
import 'package:matrimonial_app/model/user_display_model.dart';
import 'package:matrimonial_app/utils/routes.dart';
import 'package:matrimonial_app/widgets/alertbox_widgets/height_alert.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrimonial_app/widgets/gradient_button.dart';
import 'package:path_provider/path_provider.dart';
import '../../model/api.dart';
import '../../model/hometown_display_model.dart';
import '../../widgets/alertbox_widgets/hometown_alert.dart';
import '../../widgets/icon_image_provider.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen(
      {Key? key,
      this.image,
      this.user_id,
      this.index,
      this.name,
      this.age,
      this.city})
      : super(key: key);

  final image, user_id, index, name, age, city;
  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("IMAGE WIDGET : " + widget.image);
    return Scaffold(
        key: _scaffoldKey,
        // resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   title: const Text('Edit Profile'),
        // ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Untitled.png"),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    child: UserDetailsWidgets(
                        bgimage: widget.image,
                        userid: widget.user_id,
                        index: widget.index,
                        city: widget.city,
                        name: widget.name,
                        age: widget.age)))));
  }
}

class _UserDetailsWidgetsState extends State<UserDetailsWidgets>
    with TickerProviderStateMixin {
  late double screenHeight;
  late double screenWidth;
  bool isContactVisible = false;

  late count_contact_model _contact;
  bool assetimg = false;
  File? _image;
  String _gender = "Male";
  TextEditingController _name = TextEditingController(text: "");
  TextEditingController _age = TextEditingController(text: "19");
  TextEditingController _dob = TextEditingController(text: "19/09/2001");
  TextEditingController _email = TextEditingController(text: "abc@gmail.com");
  TextEditingController _hometown = TextEditingController(text: "Ahmedabad");
  TextEditingController _height = TextEditingController(text: "5' 6\"");
  TextEditingController _religion = TextEditingController(text: "Hindu");
  TextEditingController _highestQualification =
      TextEditingController(text: "B.Tech");
  TextEditingController _college =
      TextEditingController(text: "Nirma University");
  TextEditingController _occupation =
      TextEditingController(text: "Software Engineer");
  TextEditingController _income =
      TextEditingController(text: "Rs. 10,000 - 20,000");
  TextEditingController _maritalStatus =
      TextEditingController(text: "Never Married");
  TextEditingController _company = TextEditingController(text: "TCS");
  TextEditingController _aboutMe = TextEditingController(
      text:
          "I am a Software Engineer working in a MNC. I am a fun loving person and love to travel.");
  TextEditingController _settledown = TextEditingController(text: "6 Months");
  TextEditingController _community = TextEditingController(text: "Gujarati");
  TextEditingController _motherTounge = TextEditingController(text: "Gujarati");
  TextEditingController _weight = TextEditingController(text: "60 Kg");
  TextEditingController _food = TextEditingController(text: "Vegetarian");
  TextEditingController _smoke = TextEditingController(text: "Never");
  TextEditingController _drink = TextEditingController(text: "Never");
  TextEditingController _father = TextEditingController(text: "Businessman");
  TextEditingController _mother = TextEditingController(text: "Housewife");
  TextEditingController _brother = TextEditingController(text: "1");
  TextEditingController _sister = TextEditingController(text: "1");
  TextEditingController _marriedbrother = TextEditingController(text: "1");
  TextEditingController _marriedsister = TextEditingController(text: "1");
  Map<String, dynamic> _preferences = {
    "Age": TextEditingController(text: "19 to 25"),
    "Location": TextEditingController(text: "Ahmedabad"),
    "Height": TextEditingController(text: "5' 6\" to 5' 9\""),
    "Religion": <String>["Hindu", "Muslim", "Christian"],
    "Annual Income": TextEditingController(text: "Rs. 10,000 - 20,000"),
    "Marital Status": TextEditingController(text: "Never Married"),
    "Language": <String>["Gujarati", "Hindi", "English"],
    "Food": TextEditingController(text: "Vegetarian"),
    "Smoke": TextEditingController(text: "Never"),
    "Drink": TextEditingController(text: "Never")
  };
  bool _enabledbio = false;
  bool _enableddetails = false;
  bool _enablededucation = false;
  bool _enabledpersonal = false;

  List<String> _basicdetails = [
    "Hometown",
    "Height",
    "Weight",
    "Marital Status",
    "Community",
    "Religion",
    "Mother Tongue",
    "Settle-Down"
  ];

  List<String> _education = [
    "Highest Qualification",
    "College",
    "Occupation",
    "Income",
    "Company"
  ];

  List<String> _family = [
    "Father's Occupation",
    "Mother's Occupation",
    "No. of Brothers",
    "No. of Sisters",
    "Married Brothers",
    "Married Sisters"
  ];
  bool _enabledfamily = false;
  bool _enabledpreferences = false;

  List<TextEditingController> _basicdetailscontroller = [];
  List<TextEditingController> _educationcontroller = [];
  List<TextEditingController> _familycontroller = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _basicdetailscontroller = [
      _hometown,
      _height,
      _weight,
      _maritalStatus,
      _community,
      _religion,
      _motherTounge,
      _settledown
    ];

    _educationcontroller = [
      _highestQualification,
      _college,
      _occupation,
      _income,
      _company
    ];

    _familycontroller = [
      _father,
      _mother,
      _brother,
      _sister,
      _marriedbrother,
      _marriedsister
    ];
    loaddata();
  }

  Future<bool> loaddata() async {
    // final snapshot = await profile_display().profiledisplaydatalist();
    user_details_model snapshot = await userDetail().userDetails(widget.userid);
    _name.text = widget.name;
    _age.text = widget.age;
    _hometown.text = widget.city;
    if (snapshot.message.toString() == "profile data") {
      print("load data : " + snapshot.message.toString());
      final data = (snapshot.data?[0])!;
      // print("load data : " + (data.family?.isEmpty.toString())!);
      // print("load data : " + data.toString());
      // print("load data : " + (data.family?[0].toString())!);
      // print("load pref : " + (data.preference?[0].toString())! ?? "");
      _gender = data.gender!;
      _name.text = data.userName!;
      _age.text = data.age!;
      _hometown.text = data.homeTown!;
      _height.text = data.height!;
      _religion.text = data.religion!;
      _occupation.text = data.jobTitle!;
      _maritalStatus.text = data.maritalStatus!;
      _company.text = data.companyName!;
      _settledown.text = data.settleDown!;
      _dob.text = data.dob!;
      _email.text = data.email!;
      _highestQualification.text = data.highestQualification!;
      _college.text = data.college!;
      _income.text = data.salary!;
      _maritalStatus.text = data.maritalStatus!;
      _aboutMe.text = data.bio!;
      _community.text = data.community!;
      _motherTounge.text = data.motherTongue!;
      _weight.text = data.weight!.toString();
      _food.text = data.foodPreference!;
      _smoke.text = data.smoke!;
      _drink.text = data.drink!;
      if (!(data.family?.isEmpty)!) {
        _enabledfamily = true;
        final family = (data.family?[0])!;
        _father.text = family.fatherOccupation!;
        _mother.text = family.motherOccupation!;
        _brother.text = family.noOfBrother!.toString();
        _sister.text = family.noOfSister!.toString();
        _marriedbrother.text = family.noOfMarriedBrother!.toString();
        _marriedsister.text = family.noOfMarriedSister!.toString();
      }
      if (!(data.preference?.isEmpty)!) {
        _enabledpreferences = true;
        final _preference = (data.preference?[0])!;
        _preferences["Age"]!.text =
            "${_preference.minAge} to ${_preference.maxAge}";
        _preferences["Location"]!.text = _preference.location!;
        _preferences["Height"]!.text =
            "${_preference.minHeight} to ${_preference.maxHeight}";
        _preferences["Religion"] = _preference.religion!;
        _preferences["Annual Income"]!.text = "${_preference.annualIncome}";
        _preferences["Marital Status"]!.text = _preference.maritalStatus!;
        _preferences["Language"] = _preference.language!;
        _preferences["Food"]!.text = _preference.foodPreferences!;
        // _preferences["Smoke"]!.text = _preference.smoke!;
        // _preferences["Drink"]!.text = _preference.drink!;
      }

      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You've No Rights to see him/her.")));
      // Navigator.pop(context);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          screenHeight < 800
              ? SizedBox(
                  height: 40.h,
                )
              : SizedBox(
                  height: 90.h,
                ),
          //Add Image Half Screen
          Container(
            height: screenHeight * 0.8,
            width: screenWidth,
            child: Stack(
              children: [
                ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 620.h,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          onError: (exception, stackTrace) {
                            assetimg = true;
                            setState(() {});
                          },
                          image: assetimg
                              ? Image.asset("assets/bg.png").image
                              : CachedNetworkImageProvider(
                                  widget.bgimage,
                                  errorListener: () {
                                    print("error");
                                  },
                                ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //Add Multiple Images in a Row
                    Container(
                      height: 620.h,
                      width: screenWidth,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 620.h,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  onError: (exception, stackTrace) {
                                    assetimg = true;
                                    setState(() {});
                                  },
                                  image: assetimg
                                      ? Image.asset("assets/bg.png").image
                                      : CachedNetworkImageProvider(
                                          widget.bgimage,
                                          errorListener: () {
                                            print("error");
                                          },
                                        ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 620.h,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  onError: (exception, stackTrace) {
                                    assetimg = true;
                                    setState(() {});
                                  },
                                  image: assetimg
                                      ? Image.asset("assets/bg.png").image
                                      : CachedNetworkImageProvider(
                                          widget.bgimage,
                                          errorListener: () {
                                            print("error");
                                          },
                                        ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 620.h,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  onError: (exception, stackTrace) {
                                    assetimg = true;
                                    setState(() {});
                                  },
                                  image: assetimg
                                      ? Image.asset("assets/bg.png").image
                                      : CachedNetworkImageProvider(
                                          widget.bgimage,
                                          errorListener: () {
                                            print("error");
                                          },
                                        ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder<user_details_model>(
              future: userDetail().userDetails(widget.userid),
              builder: ((context, snapshots) {
                if (snapshots.hasData) {
                  if (snapshots.data?.message.toString() != "profile data") {
                    print(
                        "Future Builder : ${snapshots.data?.message.toString() ?? ""}");
                    return Container(
                        margin: EdgeInsets.all(20),
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  _name.text.toString() +
                                      ", " +
                                      _age.text.toString(),
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff3C0A53)),
                                ),
                              ),
                              //Add Ios Close button
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close),
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          //Add Home Town with icon
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color(0xff3C0A53),
                              ),
                              Text(
                                _hometown.text,
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff3C0A53)),
                              ),
                            ],
                          ),
                        ]));
                    // Navigator.pop(context);
                  } else {
                    return Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  _name.text.toString() +
                                      ", " +
                                      _age.text.toString(),
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff3C0A53)),
                                ),
                              ),
                              //Add Ios Close button
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close),
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          //Add Home Town with icon
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color(0xff3C0A53),
                              ),
                              Text(
                                _hometown.text,
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff3C0A53)),
                              ),
                            ],
                          ),
                          _buildsection(
                            height: 100.h,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 6, bottom: 6),
                              child: TextField(
                                maxLines: null,
                                expands: true,
                                keyboardType: TextInputType.multiline,
                                controller: _aboutMe,
                                enabled: _enabledbio,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54),
                                // obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 30.h,
                          ),

                          //Section for Basic Details

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildbtn(text: "Basic Detail"),
                              _buildsection(
                                  height: double.parse(
                                          _basicdetails.length.toString()) *
                                      40.h,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 30, right: 20, top: 6, bottom: 4),
                                    child: GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.only(top: 10),
                                        itemCount: _basicdetails.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 1.9),
                                        itemBuilder: (context, index) {
                                          if (index == 0) {
                                            return _buildcell(
                                                title: _basicdetails[index],
                                                value: _basicdetailscontroller[
                                                    index],
                                                enabled: _enableddetails);
                                          } else if (index == 1) {
                                            return _buildcell(
                                                title: _basicdetails[index],
                                                value: _basicdetailscontroller[
                                                    index],
                                                enabled: _enableddetails);
                                          } else {
                                            return _buildcell(
                                                title: _basicdetails[index],
                                                value: _basicdetailscontroller[
                                                    index],
                                                enabled: _enableddetails);
                                          }
                                        }),
                                  ))
                            ],
                          ),

                          SizedBox(
                            height: 30.h,
                          ),

                          //Section for Education
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildbtn(
                                text: "Education & Career",
                              ),
                              _buildsection(
                                  height: double.parse(
                                          _basicdetails.length.toString()) *
                                      40.h,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 30, right: 20, top: 0, bottom: 6),
                                    child: GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.only(top: 10),
                                        itemCount: _education.length,
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 200,
                                                childAspectRatio: 1.3),
                                        // SliverGridDelegateWithFixedCrossAxisCount(
                                        //     crossAxisCount: 2,mainAxisExtent: 120.h),
                                        itemBuilder: (context, index) {
                                          return _buildcell(
                                              title: _education[index],
                                              value:
                                                  _educationcontroller[index],
                                              enabled: _enablededucation);
                                        }),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildbtn(
                                  text: "Diet Preference",
                                ),
                                _buildsection(
                                    height: 3 * 50.h,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 20,
                                          top: 6,
                                          bottom: 6),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Food Preference",
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              _buildbtn(
                                                  width: 140.w,
                                                  text: _food.text,
                                                  type: 1),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Smoke",
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              _buildbtn(
                                                  width: 140.w,
                                                  text: _smoke.text,
                                                  type: 1),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Drink",
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              _buildbtn(
                                                  width: 140.w,
                                                  text: _drink.text,
                                                  type: 1),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                              ]),
                          SizedBox(
                            height: 30.h,
                          ),
                          _enabledfamily
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      _buildbtn(
                                        text: "Family Background",
                                      ),
                                      _buildsection(
                                          height: double.parse(
                                                  _family.length.toString()) *
                                              55.h,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 30,
                                                right: 20,
                                                top: 0,
                                                bottom: 6),
                                            child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                itemCount: _family.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                                        maxCrossAxisExtent: 200,
                                                        // mainAxisExtent: 95.h,
                                                        childAspectRatio: 1.35),
                                                // SliverGridDelegateWithFixedCrossAxisCount(
                                                //     crossAxisCount: 2,mainAxisExtent: 120.h),
                                                itemBuilder: (context, index) {
                                                  return _buildcell(
                                                      title: _family[index],
                                                      value: _familycontroller[
                                                          index],
                                                      enabled:
                                                          _enablededucation);
                                                }),
                                          ))
                                    ])
                              : Container(),
                          SizedBox(
                            height: 30.h,
                          ),
                          _enabledpreferences
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                      _buildbtn(
                                        text: "Partner Preference",
                                      ),
                                      _buildsection(
                                          height: double.parse(_preferences
                                                  .length
                                                  .toString()) *
                                              63.h,
                                          child: ListView.builder(
                                            itemBuilder: (context, index) {
                                              String key = _preferences.keys
                                                  .elementAt(index);
                                              return _buildpref(
                                                  key,
                                                  _preferences[key],
                                                  _preferences[key]
                                                          .runtimeType
                                                          .toString() ==
                                                      "CastList<dynamic, String>");
                                            },
                                            itemCount: _preferences.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.only(
                                                top: 10, left: 20),
                                          ))
                                    ])
                              : Container(),
                          // SizedBox(
                          //   height: 20.h,
                          // ),
                          GradientButton(
                            height: 50.h,
                            width: 300.w,
                            color1: Color(
                                int.parse("846699", radix: 16) + 0xFF000000),
                            color2: Colors.purple.shade200,
                            text: "View Contact",
                            onPressed: () async {
                              //View Contact Just Below Button
                              bool info =
                                  await _getContact(widget.userid, context);
                              if (info) {
                                if (_contact.message.toString() ==
                                    "count_of_contact_details added") {
                                  isContactVisible = true;
                                  setState(() {});
                                } else {
                                  isContactVisible = false;
                                  //Show Alert Dialog to Upgrade
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return AlertDialog(
                                  //         title: Text("Upgrade to View Contact"),
                                  //         content: Text("You have to upgrade to view contact details"),
                                  //         actions: [
                                  //           TextButton(
                                  //             child: Text("Cancel"),
                                  //             onPressed: () {
                                  //               Navigator.pop(context);
                                  //             },
                                  //           ),
                                  //           TextButton(
                                  //             child: Text("Upgrade"),
                                  //             onPressed: () {
                                  //               Navigator.pop(context);
                                  //               Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                       builder: (context) =>
                                  //                           MembershipScreen()));
                                  //             },
                                  //           ),
                                  //         ],
                                  //       );
                                  //     });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              _contact.message.toString())));
                                  //Navigate to Membership Plan Page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MembershipScreen()));
                                  // setState(() {});
                                }
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Something Went Wrong"),
                                ));
                              }
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          isContactVisible
                              ? _buildContact(_contact.data?[0].contactNo ?? "",
                                  _contact.data?[0].email ?? "")
                              : Container(),
                          SizedBox(
                            height: 20.h,
                          ),
                          GradientButton(
                            height: 50.h,
                            width: 300.w,
                            color1: Color(
                                int.parse("846699", radix: 16) + 0xFF000000),
                            color2: Colors.purple.shade200,
                            text: "Block",
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Block"),
                                      content: Text(
                                          "Are you sure you want to block this user?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Cancel")),
                                        TextButton(
                                            onPressed: () async {
                                              var _isBlocked =
                                                  await _blockUser();
                                              if (_isBlocked) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "User Blocked")));
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Error Occured")));
                                              }
                                            },
                                            child: Text("Block"))
                                      ],
                                    );
                                  });
                            },
                          )
                        ],
                      ),
                    );
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }))
        ]));
  }

  Widget _buildContact(String number, String email) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 20, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Phone",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(flex: 1, child: Text(number)),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "E-Mail",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Expanded(flex: 1, child: Text(email)),
            ],
          ),
        ],
      ),
    );
  }

  Future<bool> _getContact(id, context) async {
    var data = await getContact().get(id);
    if (data != null) {
      print(data.toString());
      setState(() {
        _contact = data;
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _blockUser() async {
    block_user_model model =
        await blockUser().blockList(block_id: widget.userid);
    if (model.message == "user blocked") {
      return true;
    }
    return false;
  }

  Widget _buildpref(String title, dynamic value, bool isList) {
    //Convert List to Comma Seperated String in one line
    final itemval = isList ? value.join(", ") : value.text;
    return Container(
      height: 60.h,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              itemval,
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildbtn({required String text, type = 0, width = null}) {
    return Row(
      children: [
        Container(
          width: width,
          alignment: Alignment.center,
          // margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
          decoration: BoxDecoration(
              // color: const Color(0xff3C0A53),
              color: type == 0
                  ? Color(int.parse("846593", radix: 16) + 0xFF000000)
                  : Colors.purple[50],
              // color: const Color().,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            text,
            style: TextStyle(
                fontSize: type == 0 ? 20.sp : 14.sp,
                fontWeight: FontWeight.w900,
                color: type == 0 ? Colors.white : Colors.purple[900]),
          ),
        ),
      ],
    );
  }

  Widget _buildcell({
    required String title,
    required TextEditingController value,
    required bool enabled,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 1),
      // width: double.maxFinite,
      height: 100.h,
      // padding: EdgeInsets.only(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                height: 1.25,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          Expanded(
            child: SizedBox(
              // height: 10.h,
              // width: width ?? 130.w,
              child: TextField(
                maxLines: null,
                expands: true,
                controller: value,
                enabled: enabled,
                style: TextStyle(
                    // height: 1.5,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                // obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Color(int.parse("846593", radix: 16) + 0xFF000000)),
                  ),
                  border: enabled ? UnderlineInputBorder() : InputBorder.none,
                  // border: InputBorder.none,
                  hintText: title,
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildsection({required height, required Widget child}) {
    return Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 10),
        child: child);
  }

  // void _showMessage(String message) {
  //   _scaffoldKey.currentState?.shshowSnackBar(SnackBar(content: Text(message),));
  // }
}

class UserDetailsWidgets extends StatefulWidget {
  var bgimage, userid, index, name, age, city;

  UserDetailsWidgets(
      {Key? key,
      required this.bgimage,
      this.userid,
      this.index,
      this.name,
      this.age,
      this.city})
      : super(key: key);

  @override
  State<UserDetailsWidgets> createState() => _UserDetailsWidgetsState();
}
