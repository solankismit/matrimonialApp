import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading: Row(
      //     children: [
      //       IconButton(
      //         onPressed: () {
      //           Navigator.of(context).pop();
      //         },
      //         icon: Icon(
      //           Icons.arrow_back_ios_new,
      //           color: Colors.black,
      //           // size: 0,
      //         ),
      //       ),
      //       CircleAvatar()
      //     ],
      //   ),
      //   title: Text(
      //     "Tanmay",
      //     style: TextStyle(
      //         color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
      //   ),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 2, top: 15, bottom: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        // size: 0,
                      ),
                    ),
                    CircleAvatar(radius: 23, backgroundColor: Colors.black12),
                    Container(
                      margin: EdgeInsets.only(left: 60),
                      child: Text(
                        "Tanmay",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Color(0xffD9D9D9),
                        // prefixIcon: Icon(Icons.camera_alt_rounded),
                        suffixIcon: Icon(Icons.send),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36),
                            borderSide: BorderSide(
                                width: 3, color: Color(0xffFA1BFF)))),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
