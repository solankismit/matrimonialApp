import 'dart:core';

/*
* TODO:DropDowns to be added : MARITAL STATUS, COMMUNITY RELIGION, MOTHER TONGUE, SETTLE-DOWN, HIGHEST QUALIFICATION, COLLEGE, OCCUPATION,INCOME
* TODO: Known BUGS: Overflow in highest Qualification
* */
import 'dart:io';
import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:matrimonial_app/main_screens/dashboard_screen.dart';
import 'package:matrimonial_app/model/edit_profile_model.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/api.dart';
import '../../model/hometown_display_model.dart';
import '../../widgets/alertbox_widgets/hometown_alert.dart';
import '../../widgets/icon_image_provider.dart';
//TODO: No designation from BACKEND
class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: ProfileEditWidgets()))));
  }
}

class ProfileEditWidgets extends StatefulWidget {
  const ProfileEditWidgets({Key? key}) : super(key: key);

  @override
  State<ProfileEditWidgets> createState() => _ProfileEditWidgetsState();
}

class _ProfileEditWidgetsState extends State<ProfileEditWidgets>
    with TickerProviderStateMixin {
  late double screenHeight;
  late double screenWidth;

  File? _image;

  String _gender = "Male";
  TextEditingController _name = TextEditingController();
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
  TextEditingController _designation = TextEditingController(text: "NA");

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
    "Company",
    "Designation"
  ];

  late AnimationController _bioanimationController;
  late AnimationController _basicdetailsanimationController;
  late AnimationController _educationanimationController;
  late AnimationController _personalanimationController;

  bool loaddatacalled = false;
  List<TextEditingController> _basicdetailscontroller = [];
  List<TextEditingController> _educationcontroller = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bioanimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    _basicdetailsanimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _educationanimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _personalanimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
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
      _company,
      _designation
    ];
    loaddata();
  }

  Future<bool> loaddata() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (!loaddatacalled) {
      final snapshot = await profile_display().profiledisplaydatalist();
      final data = snapshot.data!.user![0];
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
      loaddatacalled = true;
      _dob.text = DateFormat('yyyy-MM-dd').format(DateFormat("yyyy-MM-dd").parse(_dob.text)).toString();
      return true;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: loaddata(),
        builder: ((context, snapshots) {
          if (snapshots.hasData) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    screenHeight < 800
                        ? SizedBox(
                            height: 40.h,
                          )
                        : SizedBox(
                            height: 90.h,
                          ),
                    Column(
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

                        SizedBox(
                          height: 30.h,
                        ),

                        _buildprofilepic(
                            image: _image,
                            screenHeight: screenHeight,
                            screenWidth: screenWidth),
                        //Section for Personal Details
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildbtn(
                                onPressed: () {
                                  setState(() {
                                    _enabledpersonal
                                        ? _personalanimationController.reverse()
                                        : _personalanimationController
                                            .forward();
                                    _enabledpersonal = !_enabledpersonal;
                                  });
                                },
                                text: "Personal Information",
                                enabled: _enabledpersonal),
                            _buildsection(
                                animationController:
                                    _personalanimationController,
                                height: 150.h,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 30, right: 20, top: 13, bottom: 4),
                                  child: SingleChildScrollView(
                                    physics: NeverScrollableScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildcell(
                                            title: "E-Mail",
                                            value: _email,
                                            enabled: _enabledpersonal,
                                            width: double.maxFinite),
                                        _builddate(enabled: _enabledpersonal),
                                        // _buildcell(
                                        //     title: "Date Of Birth",
                                        //     value: _dob,
                                        //     enabled: _enabledpersonal,
                                        //   width: double.maxFinite
                                        // ),
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        //Section for About Me
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Add Heading Bio in Oval Shape
                            _buildbtn(
                              enabled: _enabledbio,
                              text: "About Me",
                              onPressed: () {
                                setState(() {
                                  _enabledbio
                                      ? _bioanimationController.reverse()
                                      : _bioanimationController.forward();
                                  _enabledbio = !_enabledbio;
                                });
                              },
                            ),
                            //Add About Me Editable Text
                            _buildsection(
                              height: 100.h,
                              animationController: _bioanimationController,
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
                                      color: Colors.black),
                                  // obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "About Me",
                                    hintStyle: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 30.h,
                        ),

                        //Section for Basic Details

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildbtn(
                                onPressed: () {
                                  setState(() {
                                    _enableddetails
                                        ? _basicdetailsanimationController
                                            .reverse()
                                        : _basicdetailsanimationController
                                            .forward();
                                    _enableddetails = !_enableddetails;
                                  });
                                },
                                text: "Basic Detail",
                                enabled: _enableddetails),
                            _buildsection(
                                animationController:
                                    _basicdetailsanimationController,
                                height: 300.h,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 30, right: 20, top: 6, bottom: 4),
                                  child: GridView.builder(
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.only(top: 10),
                                      itemCount: _basicdetails.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 2),
                                      itemBuilder: (context, index) {
                                        if (index == 0) {
                                          return _buildcell(
                                              title: _basicdetails[index],
                                              value: _basicdetailscontroller[
                                                  index],
                                              enabled: _enableddetails,
                                              readonly: true,
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        HomeTownAlert(
                                                            controller:
                                                                _hometown));
                                              });
                                        } else if (index == 1) {
                                          return _buildcell(
                                              title: _basicdetails[index],
                                              value: _basicdetailscontroller[
                                                  index],
                                              enabled: _enableddetails,
                                              readonly: true,
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        HeightAlert(controller: _height));
                                              });
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
                                onPressed: () {
                                  setState(() {
                                    _enablededucation
                                        ? _educationanimationController
                                            .reverse()
                                        : _educationanimationController
                                            .forward();
                                    _enablededucation = !_enablededucation;
                                  });
                                },
                                text: "Education & Career",
                                enabled: _enablededucation),
                            _buildsection(
                                animationController:
                                    _educationanimationController,
                                height: 310.h,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 30, right: 20, top: 0, bottom: 6),
                                  child: GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.only(top: 10),
                                      itemCount: _education.length,
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 260,
                                              mainAxisSpacing: 5,
                                              mainAxisExtent: 100,
                                              // childAspectRatio: 1.
                                          ),
                                      itemBuilder: (context, index) {
                                        return _buildcell(
                                            title: _education[index],
                                            value: _educationcontroller[index],
                                            enabled: _enablededucation);
                                      }),
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GradientButton(
                        height: 50.h,
                        // color1: Color(int.parse("3c0a53", radix: 16) + 0xFF000000),
                        color2:
                            Color(int.parse("b88dcd", radix: 16) + 0xFF000000),
                        color1:
                            Color(int.parse("7e5f8d", radix: 16) + 0xFF000000),
                        text: "Save Changes",
                        onPressed: () async{
                          //TODO: Save Changes
                          await EditUserProfile();
                        })
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }

  Future<bool> EditUserProfile() async {
    edit_profile_model profileEditData = await profileEdit().profileEditList(
        _name.text,
        _age.text,
        _dob.text,
        _email.text,
        _hometown.text,
        _height.text,
        _religion.text,
        _highestQualification.text,
        _college.text,
        _occupation.text,
        _income.text,
        _maritalStatus.text,
        _company.text,
        _aboutMe.text,
        _settledown.text,
        _community.text,
        _motherTounge.text,
        _weight.text);
    print(profileEditData.message);
    if (profileEditData.message == "profile updated") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile Updated Successfully")));
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pushNamed(context, MyRoutes.profileScreenRoute);
      return true;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Profile Update Failed")));
    }
    return false;
  }

  final DecorationTween decorationTween = DecorationTween(
    end: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          //
          color: Color(0xff3C0A53),
          spreadRadius: -4,
          blurRadius: 10,
        )
      ],
    ),
    begin: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
  );

  Widget _buildbtn(
      {required onPressed, required String text, required bool enabled}) {
    return Row(
      children: [
        Container(
          // margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
          decoration: BoxDecoration(
              // color: const Color(0xff3C0A53),
              color: Color(int.parse("846593", radix: 16) + 0xFF000000),
              // color: const Color().,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
        Spacer(),
        //Add Edit Icon Button
        IconButton(
          onPressed: onPressed,
          icon: enabled ? Icon(Icons.done) : Icon(Icons.edit),
          color: Colors.black,
        )
      ],
    );
  }

  Widget _buildcell(
      {required String title,
      required TextEditingController value,
      required bool enabled,
      width,
      onTap,
      readonly}) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: width ?? 260.w,
      height: 70.h,
      // padding: EdgeInsets.only(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
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
              height: 37.h,
              width: width ?? 130.w,
              child: TextField(
                readOnly: readonly ?? false,
                onTap: onTap ?? () {},
                maxLines: 2,
                minLines: 1,
                // expands: true,
                controller: value,
                enabled: enabled,
                style: TextStyle(
                    height: 1.25,
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

  Widget _builddate({enabled}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      // padding: EdgeInsets.only(),
      child: SizedBox(
        width: double.maxFinite,
        // margin: EdgeInsets.only(bottom: 10),
        // height: 190.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Date Of Birth",
              style: TextStyle(
                  height: 1.25,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(
              height: 36.h,
              width: double.maxFinite,
              child: TextField(
                // maxLines: null,
                // expands: true,
                controller: _dob,
                enabled: enabled,
                readOnly: true,
                onTap: () async {
                  print("On Tapped on Age");
                  DateTime? pickedDate = await showDatePicker(
                      fieldLabelText: "Date Of Birth",
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          1910), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);
                    setState(() {
                      _dob.text = formattedDate;
                      //find age from date of birth
                      DateTime birthDate = DateTime.parse(formattedDate);
                      DateTime currentDate = DateTime.now();
                      int age = currentDate.year - birthDate.year;
                      int month1 = currentDate.month;
                      int month2 = birthDate.month;
                      if (month2 > month1) {
                        age--;
                      } else if (month1 == month2) {
                        int day1 = currentDate.day;
                        int day2 = birthDate.day;
                        if (day2 > day1) {
                          age--;
                        }
                      }
                      _dob.text = formattedDate;
                      _age.text = age.toString();
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
                style: TextStyle(
                    height: 1.25,
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
                  hintText: "Date Of Birth",
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildsection(
      {required animationController, required height, required Widget child}) {
    return Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 10),
        child: DecoratedBoxTransition(
            position: DecorationPosition.background,
            decoration: decorationTween.animate(animationController),
            child: child));
  }

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        _image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = path.basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  Widget _buildprofilepic(
      {required File? image, required screenHeight, required screenWidth}) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
        child: CircleAvatar(
          radius: 70.r,
          backgroundColor: Colors.purple.shade200,
          // backgroundColor: Color(0xffFA1BFF),
          child: CircleAvatar(
            radius: 65.r,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 60.r,
              // backgroundColor: Color(0xfff9d2ff),
              backgroundColor: Colors.purple.shade50,
              // foregroundImage: image == null ? Image.asset(_gender=="Male" ? "assets/men.png": "assets/women.png",alignment: Alignment.centerLeft,).image : FileImage(image),
              // backgroundImage: image == null ?null : FileImage(image),
              backgroundImage: image==null ? IconImageProvider(Icons.person, size: 100) : FileImage(_image!) as ImageProvider,
              // backgroundImage: image == null ? Image.asset(_gender=="Male" ? "assets/men.png": "assets/women.png",fit: BoxFit.contain,).image : FileImage(image),
            ),
          ),
        ),
      ),
      Positioned(
        top: screenHeight < 800 ? 120.h : 170.h,
        left: screenWidth < 380 ? 140.w : 170.w,
        child: Container(
          width: screenWidth < 380 ? 32.w : 40.w,
          height: screenHeight < 800 ? 40.h : 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r), color: Colors.purple),
          // color: const Color(0xffFA1BFF)),
          child: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        "Choose option",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFA1BFF)),
                      ),
                      content: SizedBox(
                        height: 100.h,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                getImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                              splashColor: Colors.purpleAccent,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.camera,
                                      color: Colors.purpleAccent,
                                    ),
                                  ),
                                  Text(
                                    "Camera",
                                    style: TextStyle(fontSize: 18.sp),
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.purpleAccent,
                            ),
                            InkWell(
                              onTap: () {
                                getImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                              splashColor: Colors.purpleAccent,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.purpleAccent,
                                    ),
                                  ),
                                  Text(
                                    "Gallery",
                                    style: TextStyle(fontSize: 18.sp),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            icon: Icon(
              Icons.add_a_photo,
              color: Colors.white,
              size: 17.sp,
            ),
          ),
        ),
      ),
    ]);
  }
}
