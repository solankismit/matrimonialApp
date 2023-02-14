import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/gradient_button.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String phone_num='';
  static String verify='';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool signUp = false;
  TextEditingController _contactcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var height = size.height;
    // var width = size.width;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      // resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg1.png"), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200.h,
                // height: height * 0.1,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       "assets/tablet.png",
              //       width: 70,
              //       height: 70,
              //     ),
              //     Image.asset(
              //       "assets/heart1.png",
              //       width: 70,
              //       height: 70,
              //     )
              //   ],
              // ),
              // Container(
              //   width: double.infinity,
              //   // height: 150.h,
              //   child: Image.asset(
              //     "assets/h1.png",
              //     width: 150.w,
              //     height: 150.h,
              //     // width: width * 0.25,
              //     // height: height * 0.25,
              //   ),
              // ),

              Container(
                margin: EdgeInsets.only(left: 10.w),
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  "Login / Sign Up",
                  style:
                      TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                // padding: EdgeInsets.all(24.0),
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: _contactcontroller,
                  style: TextStyle(fontSize: 16.sp),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xfffeadad),
                        width: 4.w,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xfffeadad),
                        width: 4.w,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      color: Colors.black,
                    ),
                    label: Text("Phone"),
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              //   // padding: EdgeInsets.all(20.0),
              //   child: TextFormField(
              //     obscureText: true,
              //     style: TextStyle(fontSize: 16.sp),
              //     decoration: InputDecoration(
              //       enabledBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Color(0xfffeadad),
              //           width: 4.w,
              //         ),
              //       ),
              //       focusedBorder: UnderlineInputBorder(
              //         borderSide:
              //             BorderSide(color: Color(0xfffeadad), width: 4.w),
              //       ),
              //       prefixIcon: const Icon(
              //         Icons.visibility_off,
              //         color: Colors.black,
              //       ),
              //       prefixIconColor: Colors.black,
              //       // hintText: "Password",
              //
              //       label: Text("Password"),
              //       labelStyle: TextStyle(color: Colors.grey),
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(left: 28.w),
              //   child: Row(
              //     children: [
              //       Text("Don't have an account?",
              //           style: GoogleFonts.poppins(
              //               textStyle: const TextStyle(
              //                   color: Colors.black54,
              //                   letterSpacing: 0.07,
              //                   fontWeight: FontWeight.w600))),
              //       TextButton(
              //           onPressed: () {
              //             Navigator.of(context)
              //                 .pushNamed(MyRoutes.detailScreenRoute);
              //           },
              //           child: Text("Sign Up",
              //               style: GoogleFonts.poppins(
              //                 textStyle: const TextStyle(
              //                     color: Colors.redAccent,
              //                     fontWeight: FontWeight.bold),
              //               )))
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Center(
              //   child: Container(
              //     width: 136,
              //     height: 46,
              //     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 26),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(30),
              //         gradient: const LinearGradient(
              //             colors: [
              //               Color(0xfffd7a8f),
              //               Color(0xffF219EF),
              //             ],
              //             begin: Alignment.topCenter,
              //             end: Alignment.bottomCenter)),
              //     child: Center(
              //         child: Text("Log In",
              //             style: GoogleFonts.poppins(
              //               textStyle: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 15),
              //             ))),
              //   ),
              // ),
              SizedBox(
                height: 10.h,
                // height: height * 0.015,
              ),
              Center(
                child: GradientButton(
                  onPressed: () async {
                    if (_contactcontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please enter phone number")));
                    } else {
                      LoginScreen.phone_num = "+91${_contactcontroller.text}";
                      print(LoginScreen.phone_num);
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: LoginScreen.phone_num,
                        verificationCompleted: (PhoneAuthCredential credential) {
                          print('verificationCompleted.............');
                        },
                        verificationFailed: (FirebaseAuthException e) {
                          // alert = "Enter Valid Number";
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.message.toString())));
                          print('\n\n\n\n\nverificationFailed\n\n\n\n');
                        },
                        codeSent: (String verificationId, int? resendToken) {
                          print("Code sent..");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("OTP sent to ${_contactcontroller.text}")));
                          LoginScreen.verify = verificationId;
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTP2()));
                              // builder: (context) => OtpScreen()));

                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    }
                    print("AFTER OTP SENT");
                  },
                  width: 230.w,
                  height: 50.h,
                  // width: width * 0.45,
                  // height: height * 0.06,
                  text: "Log In/Sign Up with OTP",
                  color1: Color(0xfffd7a8f),
                  color2: Color(0xfff653e1),
                ),
              ),
              // SizedBox(
              //   height: 15.h,
              //   // height: height * 0.018,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "OR",
              //       style: GoogleFonts.poppins(
              //           textStyle: TextStyle(color: Colors.black54)),
              //     ),
              //     SizedBox(
              //       width: 3.w,
              //     ),
              //     Text(
              //       "Login with",
              //       style: GoogleFonts.poppins(
              //           textStyle: const TextStyle(
              //               color: Colors.redAccent,
              //               fontWeight: FontWeight.bold)),
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 20.h,
              //   // height: height * 0.022,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     GradientButton(
              //         onPressed: () {},
              //         width: 146.w,
              //         height: 50.h,
              //         color1: Color(0xff6f518d),
              //         color2: Color(0xffdb414a),
              //         text: "Google"),
              //     SizedBox(
              //       width: 20.w,
              //     ),
              //     GradientButton(
              //         width: 146.w,
              //         height: 50.h,
              //         onPressed: () {},
              //         color1: Color(0xff6c58c9),
              //         color2: Color(0xff6962f4),
              //         text: "Facebook")
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

