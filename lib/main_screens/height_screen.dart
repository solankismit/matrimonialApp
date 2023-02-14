//TODO: Height Data to Static

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:matrimonial_app/main_screens/hometown_screen.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/height_display_model.dart';
import 'package:matrimonial_app/widgets/dropdown_widgets/home_town_widget.dart';

import '../utils/routes.dart';
import '../widgets/gradient_button.dart';

class HeightScreen extends StatefulWidget {
  List<bool> isSelected = [];
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String age;
  final String gender;
  final String dob;
  final int weight;
  HeightScreen({
    Key? key,
    required this.isSelected,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.gender, required this.dob, required this.weight,
  }) : super(key: key);

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    List heightList = [
      "4’0”",
      "4’1”",
      "4’2”",
      "4’3”",
      "4’4”",
      "4’5”",
      "4’6”",
      "4’7”",
      "4’8”",
      "4’9”",
      "4’10”",
      "4’11”",
      "5’0”",
      "5’1”",
      "5’2”",
      "5’3”",
      "5’4”",
      "5’5”",
      "5’6”",
      "5’7”",
      "5’8”",
      "5’9”",
      "5’10”",
      "5’11”",
      "6’0”",
      "6’1”",
      "6’2”",
      "6’3”",
      "6’4”",
      "6’5”",
      "6’6”",
      "6’7”",
      "6’8”",
      "6’9”",
      "6’10”",
      "6’11”",
      "7’0”",
      "7’1”",
      "7’2”",
      "7’3”",
      "7’4”",
      "7’5”",
      "7’6”",
      "7’7”",
      "7’8”",
      "7’9”",
      "7’10”",
      "7’11”",
    ];
    print(heightList);
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: double.infinity,
          // height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg1.png"), fit: BoxFit.cover)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 210.h),

              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 10.w, top: 50.h),
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
              screenHeight < 800
                  ? SizedBox(
                      height: 16.h,
                    )
                  : SizedBox(
                      height: 30.h,
                    ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 50.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/height.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Height",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Color(0xff3C0A53),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1),
                            )
                          ],
                        ),
                        Text("What’s your height?",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff3C0A53),
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 30.w,
                        ),
                        widget.isSelected[0]
                            ? Image.asset(
                                "assets/men.png",
                              )
                            : Image.asset(
                                "assets/women.png",
                              )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                 Expanded(
                                child: Container(
                                  height: screenHeight * 0.427,
                                  // padding: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black54),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: ListView.builder(
                                      itemCount: heightList.length,
                                      itemBuilder: ((context, index) {
                                        // var server =
                                        //     snapshots.data?.data![index];

                                        // if (j == 11) {
                                        //   i++;
                                        //   j = 0;
                                        // } else {
                                        //   j++;
                                        // }
                                        return Column(
                                          children: [
                                            // Text(i.toString() + "'" + j.toString() + "\""),
                                            // InkWell(child: Text(height[index])),
                                            Container(
                                              padding: const EdgeInsets.all(0),
                                              width: 120,
                                              height: 40,
                                              child: TextButton(
                                                  onPressed: () {
                                                    String height = heightList[index].toString();
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: ((context) =>
                                                            HomeTownScreen(
                                                                email:
                                                                    widget
                                                                        .email,
                                                                firstName: widget
                                                                    .firstName,
                                                                lastName: widget
                                                                    .lastName,
                                                                phoneNumber: widget
                                                                    .phoneNumber,
                                                                gender: widget
                                                                    .gender,
                                                                age: widget.age,
                                                                height:
                                                                    height, dob: widget.dob, weight: widget.weight,))));
                                                  },
                                                  child: Text(
                                                   heightList[index],
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff3C0A53),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18),
                                                  )),
                                            ),

                                            Text("-----------------")
                                          ],
                                        );
                                      })),
                                ),
                              )

                ],
              ),

              // SizedBox(
              //   height: 20.h,
              // ),

              // SizedBox(
              //   height: 20.h,
              // ),
              // Center(
              //     child: GradientButton(
              //         width: 280.w,
              //         height: 50.h,
              //         color1: Color(0xfffd7a8f),
              //         color2: Color(0xfff653e1),
              //         text: "Save",
              //         onPressed: () {
              //           Navigator.of(context)
              //               .pushReplacementNamed(MyRoutes.hometownScreenRoute);
              //         })),
            ],
          ),
        ),
      ),
    );
  }
}
