import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/nav_bar_screens/chat_screen.dart';

import '../model/api.dart';
import '../model/chat_display_model.dart';

class ChatContactScreen extends StatelessWidget {
  const ChatContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 45.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "Messages",
              // textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600, fontSize: 18),
            ),
            margin: EdgeInsets.only(left: 0.w, bottom: 6.h),
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, bottom: 0),
            height: 70.h,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return CircleAvatar(
                      radius: 40, backgroundColor: Colors.black12);
                })),
          ),
          SizedBox(
            height: 20.h,
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 12),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       IconButton(
          //         icon: Icon(
          //           Icons.camera_alt,
          //           size: 40,
          //         ),
          //         onPressed: () {},
          //       ),
          //       SizedBox(
          //         width: 20.w,
          //       ),
          //       Expanded(
          //         child: Container(
          //           // width: 50,
          //           height: 55,
          //           child: TextFormField(
          //             decoration: InputDecoration(
          //                 hintText: "Search",
          //                 fillColor: Color(0xffD9D9D9),
          //                 suffixIcon: Icon(Icons.search),
          //                 focusedBorder: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(36),
          //                     borderSide: BorderSide(
          //                         width: 1, color: Colors.transparent)),
          //                 enabledBorder: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(36),
          //                     borderSide: BorderSide(
          //                         width: 1, color: Colors.transparent))),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Divider(
            thickness: 1,
            color: Colors.black12,
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child:FutureBuilder<Chat_display_model>(
                future: chat_dispaly().chatdisplaylist(),
                builder: (context, snapshots){

                  return (snapshots.hasData)?
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: snapshots.data!.data!.length,
                      itemBuilder: ((context, index) {
                        var server = snapshots.data!.data![index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5.h),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatScreen()));
                            },
                            leading: CircleAvatar(
                                radius: 35, backgroundColor: Colors.black12),
                            title: Text(
                              "Tanmay",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                            subtitle: Text(
                              //"See You!",
                              server.msg.toString(),
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                            trailing: Icon(Icons.more_vert),
                          ),
                        );
                      })
                  ):Center(child: CircularProgressIndicator());
                }

            )



          ),
        ],
      ),
    );
  }
}
