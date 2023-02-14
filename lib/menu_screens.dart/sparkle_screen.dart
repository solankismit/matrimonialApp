import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SparkleScreen extends StatelessWidget {
  const SparkleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg2.png"), fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              sparkleWidget(
                sparkleNum: 5,
                sparklePrice: 599,
              ),
              SizedBox(
                height: 15.h,
              ),
              sparkleWidget(
                sparkleNum: 10,
                sparklePrice: 599,
              ),
              SizedBox(
                height: 15.h,
              ),
              sparkleWidget(
                sparkleNum: 15,
                sparklePrice: 599,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class sparkleWidget extends StatelessWidget {
  final sparkleNum;
  final sparklePrice;
  final sparkleMrp;
  final sparkleDiscount;
  sparkleWidget({
    Key? key,
    this.sparkleNum = 0,
    this.sparklePrice = 0,
    this.sparkleMrp = 999,
    this.sparkleDiscount = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16)),
        width: 180.w,
        // height: 200.h,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              sparkleNum.toString(),
              style: TextStyle(
                  color: Color(0xffC01170),
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "sparkles",
              style: TextStyle(
                  color: Color(0xffC01170),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  sparkleMrp.toString(),
                  style: TextStyle(
                      color: Colors.black45, fontSize: 20, letterSpacing: 3),
                ),
                Text(
                  "-" + sparkleDiscount.toString() + "%",
                  style: TextStyle(
                      color: Color(0xffDC05FF), fontSize: 20, letterSpacing: 2),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              sparklePrice.toString(),
              style: TextStyle(
                  color: Color(0xff3C0A53), fontSize: 20, letterSpacing: 2),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
