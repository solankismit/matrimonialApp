import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/auth_screens/login_screen.dart';
import 'package:matrimonial_app/main_screens/dashboard_screen.dart';
// import 'package:matrimonial_app/main_screens/detail_screen.dart';
import 'package:matrimonial_app/main_screens/getting_started_screen.dart';
import 'package:matrimonial_app/main_screens/hometown_screen.dart';
import 'package:matrimonial_app/main_screens/multiple_profile_screen.dart';
import 'package:matrimonial_app/main_screens/profile_pic_screen.dart';
import 'package:matrimonial_app/main_screens/profile_screens/profile_edit_screen.dart';
import 'package:matrimonial_app/main_screens/profile_screens/profile_screen.dart';
import 'package:matrimonial_app/main_screens/welcome_screen.dart';
import 'package:matrimonial_app/menu_screens.dart/accepted_req_screen.dart';
import 'package:matrimonial_app/menu_screens.dart/blocked_profile_screen.dart';
import 'package:matrimonial_app/menu_screens.dart/contact_us_screen.dart';
import 'package:matrimonial_app/menu_screens.dart/membership/membership_screen.dart';
import 'package:matrimonial_app/menu_screens.dart/privacy_screen.dart';
import 'package:matrimonial_app/menu_screens.dart/sparkle_screen.dart';
import 'package:matrimonial_app/onStarting.dart';
import 'package:matrimonial_app/provider/data_model.dart';
import 'package:matrimonial_app/utils/routes.dart';
import 'package:matrimonial_app/widgets/dropdown_widgets/status_widget.dart';
import 'package:provider/provider.dart';
import 'main_screens/detail_screen.dart';
import 'main_screens/profile_screens/family_details_screen.dart';
import 'main_screens/profile_screens/partner_preference_screen.dart';
import 'menu_screens.dart/membership/add_card_screen.dart';
import 'menu_screens.dart/faqs_screen.dart';
import 'nav_bar_screens/user_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();

  // await FirebaseAppCheck.instance.activate();
  runApp(ChangeNotifierProvider(
    create: ((context) => DataModelProvider()),
    // builder: (context, child) => MyApp(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 810),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.pink,
        ),
        home: SplashScreen(),
        // home: MultipleProfileScreen(),
        // home: HomeTownScreen( firstName: '', lastName: '', email: '', phoneNumber: '', age: '', gender: '', dob: '', weight: 9, height: '',),
        // home: ProfilePicker(
        //   email: "xyz@gmail.com",
        //   firstName: "Ankita",
        //   lastName: "Sharma",
        //   phoneNumber: "+911234567890",
        //   dob: "12/12/1999",
        //   age: "21",
        //   bio: "ABBuiuij jdioshdioh djsdhsio dhdbslbv iusuidbspc b hd bi hsguidhajohgiu hoi",
        //   college: "IIT",
        //   companyName: "Google",
        //   community: "Brahmin",
        //   designation: "Software Engineer",
        //   drinkStatus:  "Regularly",
        //   foodpreference: "Veg",
        //   heighestQualification: "B.Tech",
        //   jobTitle: "Software Engineer",
        //   maritalstatus: "Never Married",
        //   nativeLanguage: "Hindi",
        //   religion:  "Hindu",
        //   salary: "100000",
        //   settleDownTime: "1-2 years",
        //   smokeStatus: "No",
        //   gender: "Female",
        //   weight: 90,
        //   height: "5.5\"",
        //   country: "India",
        //   homeTown: "Delhi",
        // ),
        routes: {
          MyRoutes.loginRoute: ((context) => LoginScreen()),
          // MyRoutes.signUpRoute: (context) => SignUpScreen(),
          MyRoutes.mainScreenRoute: (context) => WelcomeScreen(),
          MyRoutes.detailScreenRoute: (context) => DetailScreen(),
          // MyRoutes.genderScreenRoute: (context) => GenderScreen(),
          // MyRoutes.casteScreenRoute: (context) => CasteScreen(),
          // MyRoutes.profilepicScreenRoute: ((context) => ProfilePicker()),
          MyRoutes.profileScreenRoute: (context) => ProfileScreen(),
          MyRoutes.startScreenRoute: (context) => GettingStartedScreen(),
          MyRoutes.dashboardScreenRoute: (context) => DashboardScreen(),
          MyRoutes.acceptedReqScreenRoute: (context) => AcceptedRequestScreen(),
          MyRoutes.blockedProfileScreenRoute: (context) =>
              BlockedProfileScreen(),
          MyRoutes.contactUsProfileScreenRoute: (context) => ContactUsScreen(),
          MyRoutes.privayScreenRoute: (context) => PrivacyScreen(),
          MyRoutes.membershipScreenRoute: (context) => MembershipScreen(),
          MyRoutes.sparkleScreenRoute: (context) => SparkleScreen(),
          MyRoutes.editProfileScreenRoute: (context) => ProfileEditScreen(),
          MyRoutes.partnerPreferenceScreenRoute: (context) =>
              PartnerPreferenceScreen(),
          MyRoutes.familyDetailsScreenRoute: (context) => FamilyDetailsScreen(),
          MyRoutes.userProfileScreenRoute: (context) => UserDetailsScreen(),
          MyRoutes.faqsScreenRoute: (context) => FaqsScreen(),
          // MyRoutes.welcomeScreenRoute: (context) => WelcomeScreen(),
        },
      ),
    );
  }
}
