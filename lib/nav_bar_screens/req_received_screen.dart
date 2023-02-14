import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/display_request_model.dart'
    as rec_req;
import 'package:matrimonial_app/model/update_request_model.dart';
import 'package:matrimonial_app/nav_bar_screens/user_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:matrimonial_app/utils/sharedprefsData.dart';
import '../model/display_request_model.dart';
import '../model/user_lists_model.dart';


class RequestReceivedScreen extends StatelessWidget {
  RequestReceivedScreen({Key? key}) : super(key: key);
 late var requestList;
  Future<bool> loaddata() async {
    requestList = [];
    // ids=[];
    display_request_model data =
    await receivedRequest().userDetails();
    if (data.code == 200) {
      int? num = data.data?[0].received!.length;
      print("SENT REQUEST : $num");
      for (int i = 0; i < num!; i++) {
        if(data.data![0].received![i].profile!=null){
          var profileData = (data.data![0].received![i].profile?[0])!;
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
          children: [
            SizedBox(
              height: 30.h,
            ),
            ListTile(
              // leading: IconButton(
              //   icon: Icon(Icons.arrow_back_ios),
              //   onPressed: () => Navigator.of(context).pop(),
              //   color: Colors.black,
              // ),
              title: Container(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Received Request",
                  // textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                margin: EdgeInsets.only(left: 80.w, bottom: 6.h),
              ),
            ),
            // SizedBox(
            //   height: 0.h,
            // ),
            Expanded(
              child: Container(
                // height: 100,
                child: FutureBuilder<bool>(
                    future: loaddata(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == true) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: requestList.length,
                              itemBuilder: ((context, index) =>
                                  RequestReceivedWidget(
                                      request_id: requestList[index]["id"],
                                      city: requestList[index]["city"],
                                      age: requestList[index]["age"],
                                      name: requestList[index]["name"],
                                      userphoto: requestList[index]
                                          ["userphoto"],
                                      senderId: requestList[index]["senderId"])));
                        } else {
                          return Center(
                            child: Text("No Request Received"),
                          );
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            )
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Card(
            //     elevation: 10,
            //     child: ListTile(
            //       leading: ClipRRect(
            //         borderRadius: BorderRadius.circular(16),
            //         child: Image.network(
            //           "https://artriva.com/media/k2/galleries/8/matrimonial_5.jpg",
            //           height: 100.h,
            //           width: 80.w,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       title: Text(
            //         "Tanmay, 23",
            //         style: GoogleFonts.inter(
            //             fontWeight: FontWeight.w700, fontSize: 18),
            //       ),
            //       subtitle: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             "Product Manager",
            //             style: GoogleFonts.inter(
            //                 fontWeight: FontWeight.w700, fontSize: 16),
            //           ),
            //           Text(
            //             "Banglore, India",
            //             style: GoogleFonts.inter(
            //                 fontWeight: FontWeight.w700, fontSize: 14),
            //           )
            //         ],
            //       ),
            //       isThreeLine: true,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class RequestReceivedWidget extends StatefulWidget {
  String? userphoto;

  String? age;

  String? name;

  String? city;

  String? request_id;

  String? senderId;

  RequestReceivedWidget(
      {Key? key,
      String? this.request_id,
      String? this.userphoto,
      String? this.age,
      String? this.name,
      String? this.city,
      String? this.senderId})
      : super(key: key);

  @override
  State<RequestReceivedWidget> createState() => _RequestReceivedWidgetState();
}

class _RequestReceivedWidgetState extends State<RequestReceivedWidget> {
  bool? isAccepted = false;

  bool? isRejected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 20.w),
        // width: 400.w,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDetailsScreen(
                              user_id: widget.senderId,age: widget.age,city: widget.city,name: widget.name,image: widget.userphoto
                            )));
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.r),
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
                        Image.network(
                          // "assets/avatar.png",
                          "${widget.userphoto}",
                          fit: BoxFit.cover,
                          width: 350.w,
                          height: 300.h,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/bg.png",
                              height: 300.h,
                              width: 350.w,
                              fit: BoxFit.cover,
                            );
                          },
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
                            )),
                        Positioned(
                            top: -190.h,
                            left: 10.w,
                            child: Container(
                              width: 350.w,
                              height: 300.h,
                              margin: EdgeInsets.only(bottom: 20.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 20.w),
                                      child: Text(
                                        "${widget.name} ${widget.age}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.sp,
                                            color: Colors.white),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 20.w, bottom: 20.h),
                                      child: Text(
                                        "${widget.city}",
                                        style: TextStyle(
                                            fontSize: 18.sp, color: Colors.white),
                                      ))
                                ],
                              ),
                            ))
                      ],
                    ),
                  )),
            ),
            Positioned(
                bottom: -15,
                left: 55,
                // top: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black,
                              blurRadius: 3.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(24),
                          color: (isRejected!)
                              ? Colors.red
                              : Colors.white),
                      width: 100,
                      child: IconButton(
                        icon: Icon(Icons.cancel_outlined),
                        color: (isRejected!)
                            ? Colors.white
                            : Colors.black,
                        onPressed: () async {
                          print("cancel");
                          update_request_model model = await rejectRequest()
                              .requestAdd(request_id: widget.request_id ?? "");
                          if (model.message == "status updated") {
                            print("success");
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Request Rejected")));
                            setState(() {
                              isRejected = true;
                              isAccepted = false;
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      // padding: EdgeInsets.symmetric(vertical: 10),

                      decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black,
                            blurRadius: 3.0,
                          ),
                        ],
                        border: Border.all(width: 1, color: Color(0xffe9e9e9)),
                        borderRadius: BorderRadius.circular(24),
                        color: (isAccepted!)
                            ? Colors.green
                            : Colors.white,
                      ),
                      width: 100,
                      child: IconButton(
                        splashColor: Colors.green,
                        //Icon FOr accept

                        icon: Icon(
                          Icons.check_circle_outline,
                          color: (isAccepted!)
                              ? Colors.white
                              : Colors.green,
                        ),
                        onPressed: () async {
                          update_request_model model = await acceptRequest()
                              .requestUpdate(
                                  request_id: widget.request_id ?? "");
                          if (model.message == "status updated") {
                            print("success");
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Request Accepted")));
                            setState(() {
                              isAccepted = true;
                              isRejected = false;
                            });
                          }
                          // send_request_model reqData = await sendRequest().requestAdd(receiver_id: userid);
                          // print(reqData);
                          // if(reqData.message.toString() == "request_data added"){
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Request Sent")));
                          // }
                        },
                        // color: (isAccepted!)
                        //     ? Colors.green
                        //     : Colors.white,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
