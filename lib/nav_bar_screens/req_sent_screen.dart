import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial_app/model/display_request_model.dart';
import 'package:matrimonial_app/nav_bar_screens/user_details_screen.dart';
import 'package:matrimonial_app/utils/sharedprefsData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/api.dart';
import '../model/user_details_model.dart';
import '../model/user_lists_model.dart';

class MessageSentScreen extends StatelessWidget {
   MessageSentScreen({Key? key}) : super(key: key);

  late var requestList;
   // late List<String> ids=[];
  Future<bool> loaddata() async {
    requestList = [];
    // ids=[];
   display_request_model data =
    await receivedRequest().userDetails();
    if (data.code == 200) {
      int? num = data.data?[0].sent!.length;
      print("SENT REQUEST : $num");
      for (int i = 0; i < num!; i++) {
        if(data.data![0].sent![i].profile!=null){
          var profileData = (data.data![0].sent![i].profile?[0])!;
          // ids.add(data.data![i].id!);
          requestList.add({
            "name": profileData.userName,
            "age": profileData.age,
            "city": profileData.homeTown,
            "userphoto": profileData.userPhoto,
            "id": profileData.sId,
          });
        }
      }
      if (requestList.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg2.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Container(
              height:400,
              // width: 200.w,
              child: FutureBuilder(
                future: loaddata(),
                builder: (context, snapshot) {

                   if(snapshot.hasData ) {
                     return snapshot.data == true ? ListView.builder(
                      itemExtent: 400,
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: requestList.length,
                      itemBuilder: (context, index) {
                        return _buildWidget(
                          context: context,
                          city: requestList[index]["city"],
                          age: requestList[index]["age"],
                          name: requestList[index]["name"],
                          img: requestList[index]["userphoto"],
                          id: requestList[index]["id"],
                        );
                      },
                    ) : Center(child: Text("No Request Sent"));
                  } else {
                     return Center(child: CircularProgressIndicator());
                   }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidget({context,required String img, required String name,required String age,required String city,required String id}) {
    return Container(
margin: EdgeInsets.only(left: 10.w,top: 30.h),
      height: 10,
      child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserDetailsScreen(
                              age: age,
                              city: city,
                              name: name,
                              image: img,
                              user_id: id,
                            )));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 20,

                      // child: Container(
                      //   alignment: Alignment.bottomCenter,
                      //   height: 500.h,
                      //   width: 350.w,
                      //   padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          Container(
                            // width: 350.w,
                            // height: 500.h,
                            child: Image.network(
                              // "assets/avatar.png",
                              "https://artriva.com/media/k2/galleries/8/matrimonial_5.jpg",
                              fit: BoxFit.cover,
                              width: 350.w,
                              height: 500.h,
                            ),
                          ),
                          Positioned(
                              // left: 5.w,
                              bottom: -10.h,
                              child: Container(
                                // alignment: Alignment.bottomLeft,
                                width: 400.w,
                                height: 500.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40.r),
                                        bottomRight: Radius.circular(40.r)),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffb63c77),
                                          // Color(0xffd090ae)
                                          Colors.transparent
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 20.w),
                                        child: Text(
                                          "${name} ${age}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30.sp,
                                              color: Colors.white),
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 20.w, bottom: 20.h),
                                        child: Text(
                                          "Ahmedabad",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white),
                                        ))
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                // ),
                // Positioned(
                //     top: -20,
                //     left: 50,
                //     // top: 100,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         Container(
                //           // padding: EdgeInsets.symmetric(vertical: 10),
                //           decoration: BoxDecoration(
                //               boxShadow: [
                //                 new BoxShadow(
                //                   color: Colors.black,
                //                   blurRadius: 3.0,
                //                 ),
                //               ],
                //               borderRadius: BorderRadius.circular(24),
                //               color: Colors.white),
                //           width: 100,
                //           child: IconButton(
                //             icon: Icon(Icons.cancel_outlined),
                //             color: Colors.black,
                //             onPressed: () {},
                //           ),
                //         ),
                //         SizedBox(
                //           width: 20,
                //         ),
                //         Container(
                //           // padding: EdgeInsets.symmetric(vertical: 10),
                //
                //           decoration: BoxDecoration(
                //             boxShadow: [
                //               new BoxShadow(
                //                 color: Colors.black,
                //                 blurRadius: 3.0,
                //               ),
                //             ],
                //             border:
                //                 Border.all(width: 1, color: Color(0xffe9e9e9)),
                //             borderRadius: BorderRadius.circular(24),
                //             color: Colors.white,
                //           ),
                //           width: 140,
                //           child: Row(
                //             children: [
                //               IconButton(
                //                 icon: Icon(Icons.favorite),
                //                 onPressed: () {},
                //                 color: Colors.red,
                //               ),
                //               Text(
                //                 "Interested",
                //                 style: TextStyle(fontWeight: FontWeight.bold),
                //               )
                //             ],
                //           ),
                //         ),
                //       ],
                //     )),

                ///////////
                // Positioned(
                //   top: 80.h,
                //   left: 5.w,
                //   child: Image.network(
                //     // "assets/avatar.png",
                //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDA0iGvLaojcKNDqv09WvS1EY7n1qsc_UDzJNnIgYNNRzYqkA5sUiGsSZIRHq9TAp9jSk&usqp=CAU",
                //     fit: BoxFit.cover,
                //     width: 350.w,
                //     height: 350.h,
                //   ),
                // ),
                ///////////////////
              ],
            ),
    );
  }
}
