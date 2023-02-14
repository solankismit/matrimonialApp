import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial_app/model/user_display_model.dart';
import 'package:matrimonial_app/provider/data_model.dart';
import 'package:matrimonial_app/utils/routes.dart';
import 'package:matrimonial_app/widgets/gradient_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:matrimonial_app/utils/sharedprefsData.dart';
import '../../model/api.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  // const ProfileScreen({Key? key}) : super(key: key);
  String _gender = "Male";
  String _name = "Sachin Shah";
  String _age = "19";
  String _hometown = "Ahmedabad";
  String _height = "5' 6\"";
  String _religion = "Hindu";
  String _occupation = "Software Engineer";
  String _maritalStatus = "Never Married";
  String _company = "TCS";
  String _settledown = "6 Months";
  String _foodpreference = "vegan";

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    ImageProvider? _image;
    void _savedetails(String id,String name,String occupation) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      DataModelProvider dataModelProvider = Provider.of<DataModelProvider>(context,listen: false);
      await prefs.remove(sharedPrefsData.id);
      await prefs.remove(sharedPrefsData.name);
      await prefs.remove(sharedPrefsData.occupation);
      await prefs.setString(sharedPrefsData.id, id);
      await prefs.setString(sharedPrefsData.name, name);
      await prefs.setString(sharedPrefsData.occupation, occupation);
      dataModelProvider.setName(name);
      dataModelProvider.setOccupation(occupation);
    }
    return Sizer(

      builder:(context, orientation, deviceType) =>  Scaffold(
          body: ChangeNotifierProvider(
            create: (BuildContext context) => DataModelProvider(),
            child: FutureBuilder<user_display_model>(
                future: profile_display().profiledisplaydatalist(),
                builder: (context, snapshots) {
                  if (snapshots.hasData) {
                    if(snapshots.data?.code ==200 ){
                    final data = snapshots.data!.data!.user![0];
                     _gender = data.gender!;
                     _name = data.userName!;
                     _age = data.age!;
                     _hometown = data.homeTown!;
                     _height = data.height!;
                     _religion = data.religion!;
                     _occupation = data.jobTitle!;
                     _maritalStatus = data.maritalStatus!;
                     _company = data.companyName!;
                     _settledown = data.settleDown!;
                     _foodpreference = data.foodPreference!;
                     _savedetails((data.sId)!, (data.userName)!, (data.jobTitle)!);
                    // _image = snapshots.data.data[0].
                    return Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/Untitled.png"),
                              fit: BoxFit.cover)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                                SizedBox(
                                    height: 5.h,
                                  ),
                            Center(
                              child: Container(
                                margin:EdgeInsets.symmetric(
                                    vertical: 3.h, horizontal: 3.w),
                                child: CircleAvatar(
                                  radius: 60.sp,
                                  backgroundColor: Color(0xffFA1BFF),
                                  child: CircleAvatar(
                                    radius: 55.sp,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 50.sp,
                                      backgroundColor: Color(0xfff9d2ff),
                                      // backgroundImage:
                                      // _image == null ? null : FileImage(_image!),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              //"Sachin Shah",
                              _name,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff3C0A53)),
                            ),
                            Text(
                              // "21 years |  Male",
                              _age+
                                  " Years | " +
                                  _gender,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff3C0A53)),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _editbtn(context: context, text: "Edit Profile",onPressed:(){
                                  Navigator.of(context).pushNamed(MyRoutes.editProfileScreenRoute);
                                }),
                                _editbtn(context: context, text: "Preferences",onPressed:(){
                                  Navigator.of(context).pushNamed(MyRoutes.partnerPreferenceScreenRoute);
                                }),
                                _editbtn(context: context, text: "Family",onPressed:(){
                                  Navigator.of(context).pushNamed(MyRoutes.familyDetailsScreenRoute);
                                }),
                                ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 3.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Occupation",
                                            // snapshots.data.data[0].profile.,
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff3C0A53)),
                                          ),
                                          Text(
                                              _occupation,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff3C0A53)))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Height",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff3C0A53))),
                                          Text(
                                              //"5’2",
                                              _height,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff3C0A53)))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Religion",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff3C0A53))),
                                          Text(
                                              //"Hindu",
                                              _religion,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff3C0A53)))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Food Preference",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff3C0A53))),
                                          Text(
                                              //"Vegetarian",
                                              _foodpreference,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff3C0A53)))
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Company",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff3C0A53))),
                                          Text(
                                              // "WebEarl Technologies",
                                              _company,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff3C0A53))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Marital Status",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff3C0A53))),
                                          Text(
                                              _maritalStatus,
                                              // "Single",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff3C0A53)))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Settle-down",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff3C0A53))),
                                          Text(
                                              //"6 Months",
                                            _settledown,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff3C0A53)))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Home Town",
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff3C0A53))),
                                          Text(
                                              //"Kachchh",
                                              _hometown,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff3C0A53)))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            GradientButton(
                                width: 80.w,
                                height: 7.h,
                                color1: Color(0xff5d66e8),
                                color2: Color(0xff292abc),
                                text: "Upgrade Plan",
                                onPressed: () {
                                  Navigator.of(context).pushNamed(MyRoutes.membershipScreenRoute);
                                }),
                            SizedBox(
                              height: 1.h,
                            ),
                            GradientButton(
                                width: 80.w,
                                height: 7.h,
                                color1: Color(0xffff437d),
                                color2: Color(0xffff3ad5),
                                text: "Let's Start",
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      MyRoutes.startScreenRoute);
                                })
                          ],
                        ),
                      ),
                    );
                  }
                    else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          )),
    );
  }

  Widget _editbtn({onPressed,context,required String text}){
    return Container(
      width: 30.w,
      height: 4.8.h,
      child: ElevatedButton(
        onPressed:onPressed,
        child: Text(text,style: TextStyle(color: Color(0xffdc509c),fontSize: 10.5.sp),),
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.purple,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            shape: StadiumBorder(side: BorderSide(color: Color(0xff8f3465)))

        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)) ,
      ),
    );

  }
}
