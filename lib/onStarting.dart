import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:matrimonial_app/auth_screens/login_screen.dart';
import 'package:matrimonial_app/main_screens/getting_started_screen.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/provider/data_model.dart';
import 'package:matrimonial_app/utils/routes.dart';
import 'package:matrimonial_app/utils/sharedprefsData.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/data.dart';

class SplashScreen extends StatefulWidget {
  static SharedPreferences? prefs;
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late bool hasData;
  List title = [""];
  List description = [
    ""
  ];

  Future<SharedPreferences?> getprefs() async  {
    SplashScreen.prefs = await SharedPreferences.getInstance();
    return SplashScreen.prefs;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: getprefs(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences?> snapshot) {
        if(snapshot.hasData){
          // print();
          DataModelProvider dataModelProvider = Provider.of<DataModelProvider>(context,listen: false);
          // dataModelProvider.setName((snapshot.data?.getString("name"))?? "");
          dataModelProvider.name = (snapshot.data?.getString("name"))?? "";
          dataModelProvider.occupation = (snapshot.data?.getString("occupation"))?? "";
        }
        return EasySplashScreen(
          logo: Image.asset("assets/h1.png"),
          durationInSeconds: 3,
          navigator: snapshot.hasData ? snapshot.data?.containsKey('user')?? false ? GettingStartedScreen() :LoginScreen() : LoginScreen(),
          gradientBackground: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff630e4d),
              Color(0xff870d25),
            ],
          ),showLoader: false,
        );
      },
    );
  }
}



    // return Scaffold(
    //     body: PageView.builder(
    //         itemCount: title.length,
    //         // allowImplicitScrolling: true,
    //         scrollDirection: Axis.horizontal,
    //         itemBuilder: ((_, index) {
    //           return Container(
    //             width: double.infinity.w,
    //             height: double.infinity.h,
    //             decoration: const BoxDecoration(
    //                 backgroundBlendMode: BlendMode.multiply,
    //                 gradient: LinearGradient(
    //                   begin: Alignment.topCenter,
    //                   end: Alignment.bottomRight,
    //                   colors: [
    //                     Color(0xff630e4d),
    //                     Color(0xff870d25),
    //                   ],
    //                 )),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 SizedBox(
    //                   height: 320.h,
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Image.asset(
    //                       "assets/tablet.png",
    //                       width: 70.w,
    //                       height: 70.h,
    //                     ),
    //                     Image.asset(
    //                       "assets/heart.png",
    //                       width: 70.h,
    //                       height: 70.h,
    //                     )
    //                   ],
    //                 ),
    //                 Image.asset(
    //                   "assets/Ring.png",
    //                   width: 60.w,
    //                   height: 60.h,
    //                 ),
    //                 SizedBox(
    //                   height: 40.h,
    //                 ),
    //                 Text(title[index],
    //                     style: TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 25.sp,
    //                         fontWeight: FontWeight.w600)),
    //                 Text(
    //                   description[index],
    //                   style: GoogleFonts.kristi(
    //                       textStyle: TextStyle(
    //                           color: Colors.white,
    //                           fontSize: 10.sp,
    //                           fontWeight: FontWeight.w400)),
    //                 ),
    //                 SizedBox(
    //                   height: 80.h,
    //                 ),
    //                 index == title.length
    //                     ? Container(
    //                         width: 60.w,
    //                         height: screenHeight < 800 ? 65.h : 60.h,
    //                         decoration: BoxDecoration(
    //                             gradient: LinearGradient(colors: [
    //                               Color(0xff7a207a),
    //                               Color(0xffc0133d)
    //                             ]),
    //                             // color: Colors.white,
    //                             borderRadius: BorderRadius.circular(30.r)),
    //                         child: IconButton(
    //                           onPressed: () {
    //                             print(MediaQuery.of(context).size.width);
    //                             print(MediaQuery.of(context).size.height);
    //
    //                             Navigator.of(context)
    //                                 .pushNamed(MyRoutes.loginRoute);
    //                           },
    //                           icon: Icon(
    //                             Icons.double_arrow_sharp,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                       )
    //                     : SizedBox(
    //                         width: 60.w,
    //                         height: 60.h,
    //                       ),
    //                 SizedBox(
    //                   height: 90.h,
    //                 ),
    //                 Text(
    //                   "Meet Up",
    //                   style: GoogleFonts.inter(
    //                       textStyle: TextStyle(
    //                           color: Colors.white,
    //                           fontSize: 13.sp,
    //                           fontWeight: FontWeight.w400)),
    //                 ),
    //               ],
    //             ),
    //           );
    //         })));
