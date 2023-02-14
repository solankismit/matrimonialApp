import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/auth_screens/login_screen.dart';
import 'package:matrimonial_app/utils/routes.dart';
import 'package:matrimonial_app/widgets/gradient_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg1.png"), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Let's Create",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                // padding: EdgeInsets.all(10.0.sm),
                child: Text(
                  "Your profile",
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 8),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Center(
                  child: GradientButton(
                      width: 253.w,
                      height: 56.h,
                      color1: Color(0xfffd7a8f),
                      color2: Color(0xfff653e1),
                      text: "Let's Go",
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(MyRoutes.detailScreenRoute);
                      })),
              SizedBox(
                height: 200.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
