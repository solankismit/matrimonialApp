// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:matrimonial_app/model/api.dart';
// import 'package:matrimonial_app/model/sign_up_model.dart';
// import 'package:matrimonial_app/utils/routes.dart';
//
// import '../widgets/gradient_button.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   bool signUp = false;
//   TextEditingController _contactcontroller = TextEditingController();
//   TextEditingController _passwordcontroller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffffffff),
//       // resizeToAvoidBottomInset: false,
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/bg1.png"), fit: BoxFit.cover)),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 340.h,
//               ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //     Image.asset(
//               //       "assets/tablet.png",
//               //       width: 70,
//               //       height: 70,
//               //     ),
//               //     Image.asset(
//               //       "assets/heart1.png",
//               //       width: 70,
//               //       height: 70,
//               //     )
//               //   ],
//               // ),
//               // Container(
//               //   width: double.infinity,
//               //   child: Image.asset(
//               //     "assets/h1.png",
//               //     width: 150.w,
//               //     height: 150.h,
//               //   ),
//               // ),
//
//               Container(
//                 margin: EdgeInsets.only(left: 10.w),
//                 padding: EdgeInsets.only(
//                   left: 10.w,
//                 ),
//                 child: Text(
//                   "Sign Up",
//                   style:
//                       TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
//                 ),
//               ),
//
//               Container(
//                 // padding: EdgeInsets.all(24.0),
//                 margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   controller: _contactcontroller,
//                   style: TextStyle(fontSize: 16.sp),
//                   decoration: InputDecoration(
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Color(0xfffeadad),
//                         width: 4.w,
//                       ),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Color(0xfffeadad),
//                         width: 4.w,
//                       ),
//                     ),
//                     prefixIcon: const Icon(
//                       Icons.email_outlined,
//                       color: Colors.black,
//                     ),
//                     label: Text("Contact No."),
//                     labelStyle: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//                 // padding: EdgeInsets.all(20.0),
//                 child: TextFormField(
//                   controller: _passwordcontroller,
//                   obscureText: true,
//                   style: TextStyle(fontSize: 16.sp),
//                   decoration: InputDecoration(
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Color(0xfffeadad),
//                         width: 4.w,
//                       ),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Color(0xfffeadad), width: 4.w),
//                     ),
//                     prefixIcon: const Icon(
//                       Icons.visibility_off,
//                       color: Colors.black,
//                     ),
//                     prefixIconColor: Colors.black,
//                     // hintText: "Password",
//
//                     label: Text("Password"),
//                     labelStyle: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(left: 28.w),
//                 child: Text("By Signing up, you’re agree to our",
//                     style: GoogleFonts.poppins(
//                         textStyle: const TextStyle(
//                             color: Colors.black54,
//                             letterSpacing: 0.07,
//                             fontWeight: FontWeight.w600))),
//               ),
//               // Terms & Conditions and Privacy Poilicy
//               Container(
//                 margin: EdgeInsets.only(left: 28.w),
//                 child: Row(
//                   children: [
//                     Text("Terms & Conditions ",
//                         style: GoogleFonts.poppins(
//                             textStyle: const TextStyle(
//                                 color: Color(0xff7367ff),
//                                 letterSpacing: 0.07,
//                                 fontWeight: FontWeight.w600))),
//                     Text("and ",
//                         style: GoogleFonts.poppins(
//                             textStyle: const TextStyle(
//                                 color: Colors.black54,
//                                 letterSpacing: 0.07,
//                                 fontWeight: FontWeight.w600))),
//                     Text("Privacy Poilicy",
//                         style: GoogleFonts.poppins(
//                             textStyle: const TextStyle(
//                                 color: Color(0xff7367ff),
//                                 letterSpacing: 0.07,
//                                 fontWeight: FontWeight.w600))),
//                   ],
//                 ),
//               ),
//
//               // SizedBox(
//               //   height: 10,
//               // ),
//               // Center(
//               //   child: Container(
//               //     width: 136,
//               //     height: 46,
//               //     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 26),
//               //     decoration: BoxDecoration(
//               //         borderRadius: BorderRadius.circular(30),
//               //         gradient: const LinearGradient(
//               //             colors: [
//               //               Color(0xfffd7a8f),
//               //               Color(0xffF219EF),
//               //             ],
//               //             begin: Alignment.topCenter,
//               //             end: Alignment.bottomCenter)),
//               //     child: Center(
//               //         child: Text("Log In",
//               //             style: GoogleFonts.poppins(
//               //               textStyle: TextStyle(
//               //                   color: Colors.white,
//               //                   fontWeight: FontWeight.bold,
//               //                   fontSize: 15),
//               //             ))),
//               //   ),
//               // ),
//               SizedBox(
//                 height: 30.h,
//               ),
//               Center(
//                 child: GradientButton(
//                   width: 175.w,
//                   height: 50.h,
//                   onPressed: () async {
//                     String contact_no = _contactcontroller.text.trim();
//                     String password = _passwordcontroller.text.trim();
//
//                     String role = "customer";
//                     signup_model user_data =
//                         await signup().signupList(contact_no, password, role);
//
//                     Navigator.of(context)
//                         .pushReplacementNamed(MyRoutes.mainScreenRoute);
//                   },
//                   text: "Continue",
//                   color1: Color(0xfffd7a8f),
//                   color2: Color(0xfff653e1),
//                 ),
//               ),
//               SizedBox(
//                 height: 6.h,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Joined us before?",
//                     style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: Colors.black54,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                   SizedBox(
//                     width: 3.w,
//                   ),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.of(context)
//                             .pushReplacementNamed(MyRoutes.loginRoute);
//                       },
//                       child: Text(
//                         "Sign In",
//                         style: GoogleFonts.poppins(
//                             textStyle: TextStyle(
//                                 color: Colors.redAccent,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16.sp)),
//                       ))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
