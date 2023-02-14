import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/model/accepted_request_model.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/nav_bar_screens/user_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../model/user_details_model.dart';
import 'package:matrimonial_app/utils/sharedprefsData.dart';

import '../model/user_lists_model.dart';

class AcceptedRequestScreen extends StatelessWidget {
  AcceptedRequestScreen({Key? key}) : super(key: key);
  late List<Map<String, String>> requestList;
   // late List<String> ids=[];

  Future<bool> loaddata() async {
    requestList = [];
    bool flag = false;
    // ids=[];
    accepted_request_model snapshot = await confirmedRequest().reqlist();
    if (snapshot.data != null) {
      if (snapshot.data!.length == 0) {
        return false;
      }
      snapshot.data![0].sent!.forEach((element) {
        if (element.sId != null) {
          var profileData = element.profile![0];
          // ids.add(element.!);
          requestList.add({
            "id": profileData.sId ?? "",
            "name": profileData.userName ?? "",
            "age": profileData.age ?? "",
            "location": profileData.homeTown ?? "",
            "designation": profileData.designation ?? "NA",
            "image": profileData.userPhoto ?? "",
          });
          flag = true;
        }
      });
      print(requestList);
    }
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg2.png"), fit: BoxFit.cover)),
        child: Column(
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
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Accepted Request",
                  // textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                margin: EdgeInsets.only(left: 10.w),
              ),
            ),
            // SizedBox(
            //   height: 50.h,
            // ),
            Expanded(
              child: FutureBuilder<bool>(
                  future: loaddata(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data ?? false) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: requestList.length,
                          itemBuilder: (context, index) {
                            if(index==0){return Column(
                              children: [
                                SizedBox(height: 50.h,),
                            _buildcard(
                              context: context,
                              user_id: requestList[index]["id"] ?? "",
                              img: requestList[index]["image"] ?? "",
                            name: requestList[index]["name"] ?? "",
                            age: requestList[index]["age"] ?? "",
                            location: requestList[index]["location"] ?? "",
                            designation: requestList[index]["designation"] ?? "",)
                              ],
                            );}
                            return _buildcard(
                              context: context,
                              user_id: requestList[index]["id"] ?? "",
                              img: requestList[index]["image"] ?? "",
                                name: requestList[index]["name"] ?? "",
                                age: requestList[index]["age"] ?? "",
                                location: requestList[index]["location"] ?? "",
                                designation: requestList[index]["designation"] ?? "");
                          },
                        );
                      } else {
                        return Center(child: Text("No Data Found"));
                      }
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildcard(
      {context,required String user_id,required String name, required String age, required String location,required String designation,String img = ""}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserDetailsScreen(
                        name: name,
                        age: age,
                        city: location,
                        user_id: user_id,
                        image: img,
                      )));
        },
        child: Card(
          elevation: 10,
          child: ListTile(
            // contentPadding: EdgeInsets.all(5),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                img==""?"https://artriva.com/media/k2/galleries/8/matrimonial_5.jpg":img,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/women.png",
                    fit: BoxFit.cover,
                  );
                },
                height: 100.h,
                width: 80.w,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              "$name, $age",
              // "Tanmay, 23",
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 18.sp),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${designation}",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 15.sp),
                ),
                Text(
                  "$location",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 14.sp),
                )
              ],
            ),
            isThreeLine: true,
          ),
        ),
      ),
    );
  }
}
