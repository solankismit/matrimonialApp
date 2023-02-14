import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/auth_screens/login_screen.dart';
import 'package:matrimonial_app/onStarting.dart';
import 'package:matrimonial_app/provider/data_model.dart';
import 'package:matrimonial_app/utils/routes.dart';
import 'package:matrimonial_app/utils/sharedprefsData.dart';
import 'package:matrimonial_app/widgets/gradient_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          width: double.infinity.w,
          height: double.infinity.h,
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
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Image.asset(
                  "assets/profile_pic.png",
                  fit: BoxFit.contain,
                  width: 60,
                  height: 60,
                ),
                title: Text(
                   "${Provider.of<DataModelProvider>(context).name}"=="" ?sharedPrefsData.nameString:"${Provider.of<DataModelProvider>(context).name}",
                  // "Sachin Shah",
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                // subtitle: Text("UI/UX designer",
                  subtitle: Text("${Provider.of<DataModelProvider>(context).occupation}"=="" ?sharedPrefsData.occupationString:"${Provider.of<DataModelProvider>(context).occupation}",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15)),
              ),
              SizedBox(
                height: 30,
              ),
              drawerListTile("My Profile", CupertinoIcons.profile_circled, () {
                Navigator.of(context).pushNamed(MyRoutes.profileScreenRoute);
              }),
              SizedBox(
                height: 8,
              ),
              drawerListTile("Accepted", Icons.thumb_up_alt_outlined, () {
                Navigator.of(context)
                    .pushNamed(MyRoutes.acceptedReqScreenRoute);
              }),
              SizedBox(
                height: 8,
              ),
              drawerListTile("Blocked", Icons.block, () {
                Navigator.of(context)
                    .pushNamed(MyRoutes.blockedProfileScreenRoute);
              }),
              SizedBox(
                height: 8,
              ),
              drawerListTile("FAQ's", CupertinoIcons.question_circle, () {
                Navigator.of(context)
                    .pushNamed(MyRoutes.faqsScreenRoute);
              }),
              SizedBox(
                height: 8,
              ),
              drawerListTile("Privacy", Icons.privacy_tip_outlined, () {
                Navigator.of(context).pushNamed(MyRoutes.privayScreenRoute);
              }),
              SizedBox(
                height: 8,
              ),
              drawerListTile("Contact Us", Icons.contact_page_outlined, () {
                Navigator.of(context)
                    .pushNamed(MyRoutes.contactUsProfileScreenRoute);
              }),
              // SizedBox(
              //   height: 8,
              // ),
              // drawerListTile("Setting", Icons.settings, () {}),
              SizedBox(
                height: 8,
              ),
              drawerListTile(
                  "Upgrade membership", Icons.card_membership_outlined, () {
                Navigator.of(context).pushNamed(MyRoutes.membershipScreenRoute);
              }),
              SizedBox(
                height: 8,
              ),
              drawerListTile(
                  "Log Out", Icons.logout, () {
                    // logout(context);
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: const Text(
                      "Are you sure?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFA1BFF)),
                    ),
                    content: SizedBox(
                      height: 100.h,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async{
                              await logout(context);
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                                      (route) => false);
                            },
                            splashColor: Colors.purpleAccent,
                            child: Row(
                              children: [
                                const Padding(
                                  padding:
                                  EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.logout,
                                    color:
                                    Colors.purpleAccent,
                                  ),
                                ),
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                      fontSize: 18.sp),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.purpleAccent,
                          ),
                          InkWell(
                            onTap: () async {
                              // getImage(ImageSource.gallery,index);
                             Navigator.pop(context);
                            },
                            splashColor:
                            Colors.purpleAccent,
                            child: Row(
                              children: [
                                const Padding(
                                  padding:
                                  EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.cancel,
                                    color:
                                    Colors.purpleAccent,
                                  ),
                                ),
                                Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 18.sp),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                );

              }),
              SizedBox(
                height: 8,
              ),
            ],
          )),
    );
  }

  Future<bool> logout(context) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.clear();
  }

  InkWell drawerListTile(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
        title: Text(title,
            style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
