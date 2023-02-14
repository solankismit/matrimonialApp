// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:matrimonial_app/widgets/dropdown_widgets/bio_widget.dart';
// import 'package:matrimonial_app/widgets/dropdown_widgets/diet_screen.dart';
// import 'package:matrimonial_app/widgets/dropdown_widgets/education_widget.dart';
// import 'package:matrimonial_app/widgets/dropdown_widgets/language_widget.dart';
// import 'package:matrimonial_app/widgets/dropdown_widgets/occupation_widget.dart';

// import '../utils/routes.dart';
// import '../widgets/gradient_button.dart';
// import '../widgets/dropdown_widgets/status_widget.dart';

// class CasteScreen extends StatefulWidget {
//   const CasteScreen({Key? key}) : super(key: key);

//   @override
//   State<CasteScreen> createState() => _CasteScreenState();
// }

// class _CasteScreenState extends State<CasteScreen> {
//   List<Widget> subWidget = [
//     // LanguageWidget(),
//     // DietWidget(),
//     // EducationWidget(),
//     // OccupationWidget(),
//     BioWidget()
//   ];
//   int index = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/Untitled.png"), fit: BoxFit.cover)),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               Container(
//                 // width: double.infinity,
//                 margin: EdgeInsets.only(left: 20.w),
//                 child: IconButton(
//                   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//                   onPressed: () {
//                     setState(() {
//                       index = index - 1;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(height: 35.h),
//               Container(
//                 width: double.infinity,
//                 child: Image.asset(
//                   "assets/h1.png",
//                   width: 200.w,
//                   height: 200.h,
//                 ),
//               ),
//               Center(
//                 child: Container(
//                   margin: EdgeInsets.only(left: 10.w),
//                   padding: EdgeInsets.all(10.0),
//                   child: Text("Find precisely \nthe right character for you",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.kristi(
//                         textStyle: TextStyle(
//                             fontSize: 25.sp,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 0.3),
//                       )),
//                 ),
//               ),
//               subWidget[index],
//               Center(
//                   child: GradientButton(
//                       width: 340.w,
//                       height: 50.h,
//                       color1: Color(0xfffd7a8f),
//                       color2: Color(0xfff653e1),
//                       text: "Save",
//                       onPressed: () {
//                         setState(() {
//                           index = index + 1;
//                         });
//                       })),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
