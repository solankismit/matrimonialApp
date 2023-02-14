import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg1.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.black,
              ),
              title: Container(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Privacy policy",
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
              height: 230.h,
            ),
            Expanded(
              child: Container(
                // height: 80.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    backgroundBlendMode: BlendMode.multiply,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff7c084e),
                        Color(0xff640786),
                      ],
                    )),
                child: Container(
                  // padding: const EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(left: 20, right: 10),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Our dedication to you",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: Text(
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            "Lorem ipsum dolor \nsit amet, consectetur \nadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\n Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\ndolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\ndolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                      )
                    ],
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
