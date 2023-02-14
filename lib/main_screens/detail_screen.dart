import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/auth_screens/login_screen.dart';
import 'package:matrimonial_app/main_screens/gender_screen.dart';
import 'package:matrimonial_app/provider/data_model.dart';
import 'package:matrimonial_app/utils/routes.dart';
import 'package:matrimonial_app/utils/textfield_validators.dart';
import 'package:provider/provider.dart';

import '../widgets/gradient_button.dart';
import '../widgets/text_field_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController numberEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg1.png"), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              screenHeight < 800
                  ? SizedBox(height: 210.h)
                  : SizedBox(height: 180.h),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 10.w, top: 0.h),
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
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w, top: 10.h),
                child: Text(
                  "Basic Detail",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              TextFieldWidget(
                fieldLabel: "First Name",
                textEditingController: firstNameEditingController,
              ),
              TextFieldWidget(
                  fieldLabel: "Last name",
                  textEditingController: lastNameEditingController),
              TextFieldWidget(
                  fieldLabel: "Email address",
                  textEditingController: emailEditingController),
              // TextFieldWidget(
              //     fieldLabel: "Enter your mobile number",
              //     textEditingController: numberEditingController),
              // Container(
              //   margin: EdgeInsets.only(left: 25.w),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.warning_rounded,
              //         size: 18,
              //         color: Colors.black45,
              //       ),
              // Text(
              //   " This cannot be changed later",
              //   style: TextStyle(fontSize: 12, color: Colors.black45),
              // )
              //     ],
              //   ),
              // ),
              screenHeight < 800
                  ? SizedBox(height: 40.h)
                  : SizedBox(height: 30.h),
              Center(
                  child: GradientButton(
                      width: 280.w,
                      height: 50.h,
                      color1: Color(0xfffd7a8f),
                      color2: Color(0xfff653e1),
                      // text: "Save",
                      text: "Continue",
                      onPressed: () {
                        if (validateEmptyField([
                          emailEditingController,
                          firstNameEditingController,
                          lastNameEditingController
                        ],context)) {
                          if(validateEmail(emailEditingController.text)){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => GenderScreen(
                                    email: emailEditingController.text,
                                    firstName: firstNameEditingController.text,
                                    lastName: lastNameEditingController.text,
                                    phoneNumber: LoginScreen.phone_num,
                                  )));}
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter a valid email address")));
                          }
                        }
                      })),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Joined us before?",
              //       style: GoogleFonts.poppins(
              //           textStyle: TextStyle(
              //               color: Colors.black54,
              //               fontSize: 16.sp,
              //               fontWeight: FontWeight.w600)),
              //     ),
              //     SizedBox(
              //       width: 3.w,
              //     ),
              //     TextButton(
              //         onPressed: () {
              //           Navigator.of(context)
              //               .pushReplacementNamed(MyRoutes.loginRoute);
              //         },
              //         child: Text(
              //           "Sign In",
              //           style: GoogleFonts.poppins(
              //               textStyle: TextStyle(
              //                   color: Colors.redAccent,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 16.sp)),
              //         ))
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
