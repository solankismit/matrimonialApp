import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:matrimonial_app/main_screens/multiple_profile_screen.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:matrimonial_app/model/add_profile_model.dart';
import 'package:matrimonial_app/model/add_profile_pic_model.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/utils/routes.dart';
import 'package:matrimonial_app/widgets/gradient_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base_url.dart';
import '../onboarding.dart';

class ProfilePicker extends StatefulWidget {
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
  final String bio;
  final String dob;
  final int weight;

  final String designation;
  const ProfilePicker({
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
    required this.jobTitle,
    required this.companyName,
    required this.salary,
    required this.bio,
    required this.heighestQualification,
    required this.college, required this.dob, required this.weight, required String this.designation,
  }) : super(key: key);

  @override
  State<ProfilePicker> createState() => _ProfilePickerState();
}

class _ProfilePickerState extends State<ProfilePicker> {
  File? _image;
  bool _isLoading = false;
  Future getImage(ImageSource source) async {
    try {
      final XFile? image1 = await ImagePicker().pickImage(source: source,imageQuality: 80);
      final image = File((image1?.path)!);
      if (image == null) return;
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        // imageclass = imagePermanent;
        _image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  // File _pickedImage = File;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return _isLoading?SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator(),)) : Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Untitled.png"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.h,
            ),
            Stack(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                  child: CircleAvatar(
                    radius: 101.r,
                    backgroundColor: Color(0xffFA1BFF),
                    child: CircleAvatar(
                      radius: 98.r,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 85.r,
                        backgroundColor: Color(0xfff9d2ff),
                        backgroundImage:
                            _image == null ? null : FileImage(_image!),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight < 800 ? 160.h : 170.h,
                  left: screenWidth < 380 ? 160.w : 170.w,
                  child: Container(
                    width: screenWidth < 380 ? 50.w : 60.w,
                    height: screenHeight < 800 ? 60.h : 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.r),
                        color: const Color(0xffFA1BFF)),
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
                                // content: ListBody(children: [
                                //   InkWell(
                                //     splashColor: Colors.purpleAccent,
                                //     child: Row(
                                //       children: [
                                //         Padding(
                                //           padding: EdgeInsets.all(8),
                                //           child: Icon(
                                //             Icons.camera,
                                //             color: Colors.purpleAccent,
                                //           ),
                                //         ),
                                //         Text(
                                //           "Camera",
                                //           style: TextStyle(fontSize: 18),
                                //         )
                                //       ],
                                //     ),
                                //   )
                                // ]),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 30.sm,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Upload \nyour photograph",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700, fontSize: 25.sp),
            ),
            SizedBox(
              height: 120.h,
            ),
            GradientButton(
                color1: Color(0xfffd7a8f),
                color2: Color(0xfff653e1),
                width: 340.w,
                height: 50.h,
                text: "Save",
                onPressed: () async {
                 RegisterUser(context,true);
                  setState(() {});

                  // Navigator.of(context)
                  //     .pushReplacementNamed(MyRoutes.profileScreenRoute);
                }),
            TextButton(onPressed: (){//TODO: Implementation
              RegisterUser(context,false);
              }, child: Text("Skip",style: TextStyle(color: Colors.pinkAccent),))
          ],
        ),
      ),
    );
  }

  Future<bool> RegisterUser(context,bool _isPhotoGiven) async{

    var user_photo = _isPhotoGiven ? _image?.path: "";
    String status = "active";
    // add_profilepic_model profilePicData =
    //     await profilePicAdd().uploadImage(user_photo);
    if(_isPhotoGiven && _image == null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select a photo"),));
      return false;
    }
    setState(() {
      _isLoading = true;
    });
    add_profile_model profileAddData =
        await profileAdd().profileList(
        widget.email,
        widget.age,
        widget.gender,
        widget.bio,
        widget.maritalstatus,
        widget.religion,
        widget.nativeLanguage,
        widget.community,
        widget.settleDownTime,
        widget.homeTown,
        widget.height,
        widget.heighestQualification,
        widget.college,
        widget.jobTitle,
        widget.companyName,
        widget.salary,
        widget.foodpreference,
        widget.smokeStatus,
        widget.drinkStatus,
        widget.firstName + " " + widget.lastName,
        status,
        "free", //TODO: change this and next to dynamic
        "free",
        DateTime.now().toString(),
        _isPhotoGiven ? user_photo : "",
        widget.country,
        widget.weight.toString(),
        widget.phoneNumber,
        widget.dob,
        widget.designation);

    setState(() {
      _isLoading = false;
    });
    print(profileAddData.message.toString());
    if (profileAddData.message.toString() == "profile added") {
      SharedPreferences _prefs =
          await SharedPreferences.getInstance();
      _prefs.setString(
          "user", profileAddData.data!.token.toString());
      _prefs.setString('phone_no', widget.phoneNumber);
      //Navigate to OnBoarding Screen
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MultipleProfileScreen()));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => MultipleProfileScreen()),
              (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Successful')));

      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else if (profileAddData.message.toString() ==
        "Data is Already Registered") {
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MultipleProfileScreen()));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(profileAddData.message.toString())));

      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Failed')));
    }
    return true;
  }
}
