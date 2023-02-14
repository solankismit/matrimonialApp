import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial_app/drawer.dart';
import 'package:matrimonial_app/nav_bar_screens/chat_contact_screen.dart';
import 'package:matrimonial_app/nav_bar_screens/matched_screen.dart';
import 'package:matrimonial_app/nav_bar_screens/req_sent_screen.dart';
import 'package:matrimonial_app/nav_bar_screens/req_received_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List pages = [
    MatchedScreen(),
    RequestReceivedScreen(),
    MessageSentScreen(),
    ChatContactScreen()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: MyDrawer(),

      body: Stack(children: [
        pages[currentIndex],
        Positioned(
          left: 10.w,
          top: 30.h,
          child: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          iconSize: 20.sp,
          // showUnselectedLabels: false,
          // showSelectedLabels: false,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.red,),
              label: "Matched",),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_rounded), label: "Received"),
            BottomNavigationBarItem(
                icon: Icon(Icons.send), label: "Sent"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat")
          ]),
    );
  }
}
