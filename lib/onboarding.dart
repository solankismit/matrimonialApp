import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:matrimonial_app/utils/routes.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  List title = ["FIND ME", "CHOOSE YOUR PARTNER HERE", "HOW ABOUT WE MAKE"];
  List description = [
    "Track your best match here",
    "Beyond question, theseapplication here decreased the weight of tracking down the right match",
    "Go along with us And track down your match"
  ];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: PageView.builder(
            itemCount: title.length,
            controller: _controller,
            // allowImplicitScrolling: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((_, index) {
              return Container(
                width: screenWidth,
                height: screenHeight,
                decoration: const BoxDecoration(
                    backgroundBlendMode: BlendMode.multiply,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff630e4d),
                        Color(0xff870d25),
                      ],
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 320.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/tablet.png",
                          width: 70.w,
                          height: 70.h,
                        ),
                        Image.asset(
                          "assets/heart.png",
                          width: 70.h,
                          height: 70.h,
                        )
                      ],
                    ),
                    Image.asset(
                      "assets/Ring.png",
                      width: 60.w,
                      height: 60.h,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(title[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600)),
                    Text(
                      description[index],
                      style: GoogleFonts.kristi(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    index == title.length - 1
                        ? Container(
                            width: 60.w,
                            height: screenHeight < 800 ? 65.h : 60.h,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xff7a207a),
                                  Color(0xffc0133d)
                                ]),
                                // color: Colors.white,
                                borderRadius: BorderRadius.circular(30.r)),
                            child: IconButton(
                              onPressed: () {
                                print(MediaQuery.of(context).size.width);
                                print(MediaQuery.of(context).size.height);

                                Navigator.of(context)
                                    .pushNamed(MyRoutes.loginRoute);
                              },
                              icon: Icon(
                                Icons.double_arrow_sharp,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(
                            width: 60.w,
                            height: screenHeight < 800 ? 65.h : 60.h,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xff7a207a),
                                  Color(0xffc0133d)
                                ]),
                                // color: Colors.white,
                                borderRadius: BorderRadius.circular(30.r)),
                            child: IconButton(
                              onPressed: () {
                                print(MediaQuery.of(context).size.width);
                                print(MediaQuery.of(context).size.height);

                                _controller.nextPage(duration: _kDuration, curve: _kCurve);
                              },
                              icon: Icon(
                                Icons.double_arrow_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 90.h,
                    ),
                    Text(
                      "Meet Up",
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              );
            })));
  }
}
