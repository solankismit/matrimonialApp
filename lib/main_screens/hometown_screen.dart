// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:matrimonial_app/widgets/dropdown_widgets/bio_widget.dart';
// import 'package:matrimonial_app/widgets/dropdown_widgets/diet_screen.dart';
// import 'package:matrimonial_app/widgets/dropdown_widgets/education_widget.dart';
// import 'package:matrimonial_app/widgets/dropdown_widgets/home_town_widget.dart';
// import 'package:matrimonial_app/widgets/dropdown_widgets/language_widget.dart';
// import 'package:matrimonial_app/widgets/dropdown_widgets/occupation_widget.dart';

// import '../utils/routes.dart';
// import '../widgets/dropdown_widgets/status_widget.dart';
// import '../widgets/gradient_button.dart';

// class HomeTownWidgetScreen extends StatefulWidget {
//   final String height;
//   const HomeTownWidgetScreen({
//     Key? key,
//     required this.height,
//   }) : super(key: key);

//   @override
//   State<HomeTownWidgetScreen> createState() => _HomeTownWidgetScreenState();
// }

// class _HomeTownWidgetScreenState extends State<HomeTownWidgetScreen> {
//   List<Widget> subWidget = [
//     // HomeTownWidget(),
//     // LanguageWidget(),
//     // DietWidget(),
//     // EducationWidget(),
//     // OccupationWidget(),
    // BioWidget()
//   ];
//   int index = 0;

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
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 35,
//               ),
//               Container(
//                 // width: double.infinity,
//                 margin: EdgeInsets.only(left: 20.w),
//                 child: IconButton(
//                   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//                   onPressed: () {
//                     setState(() {
//                       index > 0
//                           ? index = index - 1
//                           : Navigator.of(context).pop();
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(height: 210.h),

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
//               // SizedBox(
//               //   height: 15.h,
//               // ),
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
//                           index == subWidget.length - 1
//                               ? Navigator.of(context).pushReplacementNamed(
//                                   MyRoutes.profilepicScreenRoute)
//                               : index = index + 1;
//                         });
//                       })),
//               // SizedBox(
//               //   height: 19.h,
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
