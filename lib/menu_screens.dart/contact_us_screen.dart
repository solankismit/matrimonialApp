import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Untitled1.png"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.black,
              ),
              title: Container(
                padding: EdgeInsets.only(left: 30.w),
                child: Text(
                  "Contact Us",
                  // textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      color: Color(0xff3C0A53),
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                margin: EdgeInsets.only(left: 50.w),
              ),
            ),
            SizedBox(
              height: 180.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: Text(
                "We’re Happy",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    letterSpacing: 2),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.w),
              child: Text(
                "to hear from you!!",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    letterSpacing: 2),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: Text(
                "Let us know your queries and feedbacks",
                style: TextStyle(
                    color: Color(0xff3C0A53),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      elevation: 6,
                      shadowColor: Colors.black,
                      primary: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: Color(0xff783343),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Call us",
                          style: TextStyle(
                              color: Color(0xff783343),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      elevation: 6,
                      shadowColor: Colors.black,
                      primary: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          color: Color(0xff783343),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Mail us",
                          style: TextStyle(
                              color: Color(0xff783343),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
