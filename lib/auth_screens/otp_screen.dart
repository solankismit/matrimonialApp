import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../main_screens/profile_screens/profile_screen.dart';
import '../model/api.dart';
import '../model/login_model.dart';
import '../utils/routes.dart';
import 'login_screen.dart';
class OTP2 extends StatefulWidget {
  const OTP2({Key? key}) : super(key: key);

  @override
  State<OTP2> createState() => _OTP2State();
}

class _OTP2State extends State<OTP2> {

  final pinController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static const double dist = 3.0;
  String otp = "";
  late AppDimens appDimens;
  bool isLoading = false;
  String _verificationId = "";
  bool autovalidate = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    _verificationId = LoginScreen.verify;
    super.initState();
  }


  void _resendOTP() async {
    String phone = LoginScreen.phone_num;
    final SharedPreferences prefs = await _prefs;
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          // Utility.showToast(msg: "Invalid Phone Number");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('The provided phone number is not valid.'),
            ),
          );
          print('The provided phone number is not valid.');
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Something went wrong, try again later.'),
            ),
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Utility.showToast(msg: "Code Sent");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Code Sent'),
          ),
        );
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  void _signInWithPhoneNumber(String otp) async {
    final SharedPreferences prefs = await _prefs;
    // String? first_name = prefs.getString("first_name");
    // String? last_name = prefs.getString("last_name");
    // String? email_address = prefs.getString("email_address");
    // String? password = prefs.getString("password");
    // String? contect_no = prefs.getString("contect_no");

    _showProgressDialog(true);

    if (await Utility.checkInternet()) {
      try {
        final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId,
          smsCode: otp,
        );
        final User? user = (await _auth.signInWithCredential(credential)).user;
        final User? currentUser = _auth.currentUser;
        // assert(user?.uid == currentUser?.uid);
        print(user);

        // _showProgressDialog(false);

        String contact_no = LoginScreen.phone_num;
        // String password = "123456";
        //
        // String role = "customer";

        login_model userData =
        await Login().loginList(contact_no);

        // if (user != null) {
        //   print(user);
        //   Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => DashBoardScreen(),
        //   ));
        // }
        print(userData.message.toString());
        if (userData.message.toString() == "successfully login") {
          if (user != null) {
            print("SUCCESS 😊👌👌👌👌👌");
            prefs.setString("user", userData.data!.token.toString());
            prefs.setString('phone_no', contact_no);
            //continueClick();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(" You Are Successfully Login ..."),
              backgroundColor: Colors.green,
            ));
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (context) => ProfileScreen(),
            // ));
            //Navigate to ProfileScreen and remove all previous routes
            Navigator.pushNamedAndRemoveUntil(
                context, MyRoutes.profileScreenRoute, (route) => false);
          }
        }

        else {
          // Utility.showToast(msg: "Sign in failed");
          print("In Details Page");
          Navigator.pushReplacementNamed(context, MyRoutes.mainScreenRoute);
        }
      } catch (e) {
        print(e);
        // Utility.showToast(msg: e.toString());
        // print("User is already SignUP");
        print("Wrong OTP");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Wrong OTP ..."),
          backgroundColor: Colors.red,
        ));
        _showProgressDialog(false);
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(" You Are Successfully Register ..."),
        //   backgroundColor: Colors.red,
        // ));
      }
    } else {
      _showProgressDialog(false);
      // Utility.showToast(msg: "No internet connection");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("No internet connection ..."),
        backgroundColor: Colors.red,
      ));
    }
  }

  _showProgressDialog(bool isloadingstate) {
    if (mounted)
      setState(() {
        isLoading = isloadingstate;
      });
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();

  }

  verifyOtp(String otpText) async {
    _signInWithPhoneNumber(otpText);
  }

//
  @override
  Widget build(BuildContext context) {
    debugPrint(_verificationId);
    // return Container();
    appDimens = new AppDimens(MediaQuery
        .of(context)
        .size);


    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.blackColor,
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            top: false,
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(appDimens.paddingw16),
                        child: Center(
                          child: Text(
                            "An " +
                                "SMS"
                                    " with the verification code has been sent to your registered " +
                                "mobile number",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: appDimens.text16,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: appDimens.paddingw16),
                        child: Visibility(
                          visible: LoginScreen.phone_num == null ? false : true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                LoginScreen.phone_num,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: appDimens.text20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.edit),
                                color: AppColors.greyText,
                                iconSize: appDimens.iconsize,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: appDimens.paddingw16),
                        child: Center(
                          child: Text(
                            "Enter 6 digits code",
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: appDimens.text12,
                            ),
                          ),
                        ),
                      ),
                      //Add Pinput here
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: Pinput(
                          controller: pinController,
                          length: 6,
                          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                          closeKeyboardWhenCompleted: true,
                          listenForMultipleSmsOnAndroid: true,
                          useNativeKeyboard: true,
                          autofillHints: [AutofillHints.oneTimeCode],
                          showCursor: true,
                          onChanged: (value) {
                            print(value);
                            otp = value;
                            // if (value.length == 6) {
                            //   verifyOtp(value);
                            // }
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Utility.loginButtonsWidget(
                        "",
                        "Continue",
                            () {
                          verifyOtp(otp);
                        },
                        AppColors.blackColor,
                        AppColors.blackColor,
                        appDimens,
                        AppColors.whiteColor,
                        borderRadius: 16,
                        margin: EdgeInsets.all(10),
                      ),
                      InkWell(
                        onTap: () {
                          _resendOTP();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: appDimens.paddingw6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(),
                              Text(
                                "Didn't receive " + "SMS? ",
                                style: TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: appDimens.text16,
                                ),
                              ),
                              Text(
                                "Resend",
                                style: TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: appDimens.text16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          isLoading
              ? Utility.progress(context, color: Colors.white)
              : Container(),
        ],
      ),
    );
  }
}



//For App Color
class AppColors {
  static Color whiteColor = Colors.white;
  static Color selectedColor = Color(0xff9D9D9D);
  static Color blackColor = Colors.black;
  static Color backGroundColor = Color(0xff262626);
  static Color greyText = Colors.grey.shade700;
}

//for the dimention of otp screen
enum DeviceType {
  ANDROIDPHONE,
  ANDROID7INCHTABLET,
  ANDROID10INCHTABLET,
  IOSIPAD3GEN, // WIDTH 834 HEIGHT 1112
  IOSIPADPRO12INCHTABLET, // WIDTH 1024
  IOSIPADPRO11INCHTABLET, // WIDTH 834 HEIGHT 1194
  IOSIPADPRO9INCHTABLET, // WIDTH 768
  IOSIPAD7, // WIDTH 810
  IOSDEVICE
}

class AppDimens {
  double text96 = 96.0;
  double text60 = 60.0;
  double text48 = 48.0;
  double text34 = 34.0;
  double text26 = 26.0;
  double text24 = 24.0;
  double text22 = 22.0;
  double text20 = 20.0;
  double text18 = 18.0;
  double text16 = 16.0;
  double text14 = 14.0;
  double text12 = 12.0;
  double text10 = 10.0;
  double text8 = 8.0;

  double button = 16.0;

  double paddingw2 = 2.0;
  double paddingw4 = 4.0;
  double paddingw6 = 6.0;
  double paddingw8 = 8.0;
  double paddingw10 = 10.0;
  double paddingw12 = 12.0;
  double paddingw14 = 14.0;
  double paddingw16 = 16.0;
  double paddingw18 = 18.0;
  double paddingw20 = 20.0;
  double paddingw22 = 22.0;
  double paddingw24 = 24.0;
  double paddingw26 = 26.0;
  double paddingw28 = 28.0;
  double paddingw30 = 30.0;

  double iconsize = 24;

  DeviceType deviceType = DeviceType.ANDROIDPHONE;
  AppDimens(Size size) {
    _getDevicetypes(size);
    _initSizes(size);
  }

  _initSizes(Size size) {
    double screenwidth = size.width;
    double screenheight = size.height;
    if ((screenwidth > 700)) {
      increasevalues(4.0, 4.0);
    } else if ((screenwidth >= 600 && screenwidth <= 700)) {
      increasevalues(2.0, 2.0);
    } else {
      increasevalues(0.0, 0.0);
    }
  }

  increasevalues(double textvalue, double paddingvalue) {
    text96 = 96.0 + textvalue;
    text60 = 60.0 + textvalue;
    text48 = 48.0 + textvalue;
    text34 = 34.0 + textvalue;
    text26 = 26.0 + textvalue;
    text24 = 24.0 + textvalue;
    text22 = 22.0 + textvalue;
    text20 = 20.0 + textvalue;
    text18 = 18.0 + textvalue;
    text16 = 16.0 + textvalue;
    text14 = 14.0 + textvalue;
    text12 = 12.0 + textvalue;
    text10 = 10.0 + textvalue;
    text8 = 8.0 + textvalue;

    button = 16.0 + textvalue;

    paddingw2 = 2.0 + paddingvalue;
    paddingw4 = 4.0 + paddingvalue;
    paddingw6 = 6.0 + paddingvalue;
    paddingw8 = 8.0 + paddingvalue;
    paddingw10 = 10.0 + paddingvalue;
    paddingw12 = 12.0 + paddingvalue;
    paddingw14 = 14.0 + paddingvalue;
    paddingw16 = 16.0 + paddingvalue;
    paddingw18 = 18.0 + paddingvalue;
    paddingw20 = 20.0 + paddingvalue;
    paddingw22 = 22.0 + paddingvalue;
    paddingw24 = 24.0 + paddingvalue;
    paddingw26 = 26.0 + paddingvalue;
    paddingw28 = 28.0 + paddingvalue;
    paddingw30 = 30.0 + paddingvalue;

    iconsize = 24;
  }

  _getDevicetypes(Size size) {
    double screenwidth = size.width;
    double screenheight = size.height;
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        if ((screenwidth >= 600 && screenwidth <= 700)) {
          deviceType = DeviceType.ANDROID7INCHTABLET;
        } else if ((screenwidth > 700)) {
          deviceType = DeviceType.ANDROID10INCHTABLET;
        } else {
          deviceType = DeviceType.ANDROIDPHONE;
        }
      } else if (Platform.isIOS) {
        if ((screenwidth >= 750 && screenwidth <= 800)) {
          deviceType = DeviceType.IOSIPADPRO9INCHTABLET;
        } else if ((screenwidth > 800 && screenwidth < 900)) {
          if (screenwidth == 810) {
            deviceType = DeviceType.IOSIPAD7;
          } else if (screenwidth == 834 && screenheight == 1194) {
            deviceType = DeviceType.IOSIPADPRO11INCHTABLET;
          } else if (screenwidth == 834 && screenheight == 1112) {
            deviceType = DeviceType.IOSIPAD3GEN;
          }
        } else if ((screenwidth > 1000)) {
          deviceType = DeviceType.IOSIPADPRO12INCHTABLET;
        } else {
          deviceType = DeviceType.IOSDEVICE;
        }
      }
    }
  }
}
//
//for the otp utility
class Utility {
  static Widget loginButtonsWidget(String icon, String text, Function() onTap,
      Color borderColor, Color color, AppDimens appDimens, Color textColor,
      {required EdgeInsetsGeometry margin, required double borderRadius}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin != null
            ? margin
            : EdgeInsets.only(
          left: appDimens.paddingw16 * 2,
          right: appDimens.paddingw16 * 2,
          bottom: appDimens.paddingw10,
        ),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              color: Colors.black54,
            ),
          ],
          border: Border.all(color: borderColor, width: 0.1),
          borderRadius:
          BorderRadius.circular(borderRadius != null ? borderRadius : 50),
        ),
        child: Container(
          padding: EdgeInsets.all(appDimens.paddingw10),
          child: Row(
            children: <Widget>[
              icon.trim().length == 0
                  ? Container()
                  : Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: appDimens.paddingw10),
                child: Image.asset(
                  icon,
                  height: appDimens.iconsize,
                  width: appDimens.iconsize,
                ),
              ),
              Spacer(),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: appDimens.text14,
                    color: textColor,
                    fontWeight: FontWeight.w700),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  static showToast({required String msg}) {
    Fluttertoast.showToast(msg: msg);
  }

  static Widget progress(BuildContext context, {required Color color}) {
    return Container(
      alignment: Alignment.center,
      color: color != null ? color : Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            backgroundColor: AppColors.blackColor.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.blackColor),
          ),
        ),
      ),
    );
  }

  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}


// ------------------------------------------------------------
