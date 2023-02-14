import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial_app/utils/routes.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Untitled1.png"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150.h,
            ),
            Image.asset(
              "assets/start.png",
              width: 400.w,
              height: 400.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 40.w),
              child: const Text(
                "Congrats!",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40.w),
              child: const Text(
                  "Now revel in your lifestyles \nwith the one you love",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1)),
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(MyRoutes.dashboardScreenRoute);
                },
                child: Container(
                  width: 60.w,
                  height: screenHeight < 800 ? 70.h : 60.h,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xffe35af0), Color(0xff5839f5)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(60.r)),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
