import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/send_request_model.dart';
import 'package:matrimonial_app/model/user_lists_model.dart';
import 'package:matrimonial_app/nav_bar_screens/user_details_screen.dart';
import 'package:matrimonial_app/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MatchedScreen extends StatefulWidget {
  MatchedScreen({Key? key}) : super(key: key);

  @override
  State<MatchedScreen> createState() => _MatchedScreenState();
}

class _MatchedScreenState extends State<MatchedScreen>
    with SingleTickerProviderStateMixin {
  List<Data>? userlist;
  late AnimationController _controller;
  late Animation<Offset> _offset;

  final _myListKey = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    /*Tween<Offset>(
        begin: const Offset(0,0),
        end: Offset(-1,0),
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn, reverseCurve: Curves.bounceOut)),*/
    _offset = Tween<Offset>(begin: Offset.zero, end: Offset(-1.0, 0.0))
        .animate(_controller);
    // _offset = Tween<Offset>(begin: Offset.zero, end: Offset(1,0))
    //     .animate(_controller);
  }

  void loaddata() async {
    // userlist = await Api().getuserlist();
    user_list_model snapshot = await userList().userLists();
    if (snapshot.data != null) {
      userlist = snapshot.data?.toList();
    }
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print("TOKEN : "+_prefs.getString("user")!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(userlist?.length.toString());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg2.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 100.h,
            // ),
            Expanded(
              child: FutureBuilder<user_list_model>(
                  future: userList().userLists(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data?.data != null) {
                      // userlist = snapshot.data?.data;
                      return snapshot.data?.message == "user list retrived"
                          ? SizedBox(
                              height: 900.h,
                              child: ((userlist?.length) ?? 0) >= 1
                                  ? AnimatedList(
                                      key: _myListKey,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      initialItemCount: (userlist?.length) ?? 1,
                                      itemBuilder: (context, index, animation) {
                                        // print(userlist?[index].userName);
                                        return SlideTransition(
                                          position: _offset,
                                          child: _buildCard((userlist?[index])!,
                                              context, index, animation),
                                        );
                                      },
                                    )
                                  : Center(
                                      child: Text("No Person Found"),
                                    ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      Data item, BuildContext context, index, Animation<double> animation) {
    // String name = userlist?[index].userName.toString() ?? "";
    // int age = int.parse(userlist?[index].age ?? "0");
    // String city = userlist?[index].homeTown.toString() ?? "";
    // String image = userlist?[index].userPhoto.toString() ?? "";
    // var userid = userlist?[index].sId.toString() ?? "";
    String name = item.userName.toString() ?? "";
    int age = int.parse(item.age ?? "0");
    String city = item.homeTown.toString() ?? "";
    String designation = item.designation.toString() ?? "";
    // String image = "https://source.unsplash.com/random/200x200?sig=$index";
    String image = item.userPhoto.toString() ?? "";
    String userid = item.sId.toString() ?? "";
    return Container(
        margin: EdgeInsets.only(bottom: 40, top: 100),
        alignment: Alignment.center,
        child: Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) async {
            // Remove the item from the data source.
            _myListKey.currentState?.removeItem(index, (context, animation) {
              final item = userlist!.removeAt(index);
              // if Swipe direction is to right then send request to user
              // (userlist!.removeAt(index));
              return Container();
            });
              if (direction == DismissDirection.startToEnd) {
                send_request_model reqData = await sendRequest()
                    .requestAdd(receiver_id: userid);
                print(reqData);
                if (reqData.message.toString() ==
                    "request_data added") {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Request Sent")));
                }
                else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(reqData.message.toString())));
                  }
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Person Discarded")));
              }
            // userlist!.removeAt(index);
            setState(() {});
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 20,
                  child: InkWell(
                    onTap: () {
                      print("tapped");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDetailsScreen(
                                    image: image,
                                    user_id: userid,
                                    name: name,
                                    age: age.toString(),
                                    city: city,
                                  )));
                    },
                    child: Stack(
                      children: [
                        Hero(
                          tag: "$image${index.toString()}",
                          child: CachedNetworkImage(
                            cacheManager: CacheManager(
                              Config(
                                "fluttercampus",
                                stalePeriod: const Duration(hours: 1),
                                //one week cache period
                              ),
                            ),
                            // "assets/avatar.png",
                            imageUrl: image,
                            // imageUrl: "https://artriva.com/media/k2/galleries/8/matrimonial_5.jpg",
                            errorWidget: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/bg.png",
                                height: 620.h,
                                width: 350.w,
                                fit: BoxFit.cover,
                              );
                            },
                            // "https://artriva.com/media/k2/galleries/8/matrimonial_5.jpg",
                            progressIndicatorBuilder:
                                (context, child, downloadProgress) {
                              return Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              );
                            },
                            fit: BoxFit.cover,
                            width: 350.w,
                            height: 620.h,
                          ),
                        ),
                        // Image.network(
                        //   // "assets/avatar.png",
                        //   image,
                        //   // "https://artriva.com/media/k2/galleries/8/matrimonial_5.jpg",
                        //   loadingBuilder: (context, child, loadingProgress) {
                        //     if (loadingProgress == null) return child;
                        //     return Center(
                        //       child: CircularProgressIndicator(
                        //         value: loadingProgress.expectedTotalBytes != null
                        //             ? loadingProgress.cumulativeBytesLoaded /
                        //                 loadingProgress.expectedTotalBytes!
                        //             : null,
                        //       ),
                        //     );
                        //   },
                        //   fit: BoxFit.cover,
                        //   width: 350.w,
                        //   height: 620.h,
                        // ),
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
                                          left: 20.w),
                                      child: Text(
                                        designation=="null"?"NA":"$designation",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.white),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 20.w, bottom: 20.h),
                                      child: Text(
                                        "$city",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.white),
                                      )),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              // ),
              Positioned(
                  top: -20,
                  left: 50,
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
                            color: Colors.white),
                        width: 100,
                        child: IconButton(
                          icon: Icon(Icons.cancel_outlined),
                          color: Colors.black,
                          onPressed: () {
                            final item = userlist!.removeAt(index);
                            _myListKey.currentState?.removeItem(index,
                                (context, animation) {
                              // (userlist!.removeAt(index));
                              return SlideTransition(
                                  position: animation.drive(Tween(
                                      begin: Offset(-1, 0.0),
                                      end: Offset.zero)),
                                  child: _buildCard(
                                      item, context, index, animation));
                            }, duration: Duration(milliseconds: 300));
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
                          border:
                              Border.all(width: 1, color: Color(0xffe9e9e9)),
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white,
                        ),
                        width: 140,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () async {
                                print("ON PRESSED MATCHED SCREEN");
                                send_request_model reqData = await sendRequest()
                                    .requestAdd(receiver_id: userid);
                                print(reqData);
                                if (reqData.message.toString() ==
                                    "request_data added") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Request Sent")));
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(reqData.message.toString())));
                                }
                                final item = userlist!.removeAt(index);
                                _myListKey.currentState?.removeItem(index,
                                    (context, animation) {
                                  // (userlist!.removeAt(index));
                                  return SlideTransition(
                                      position: animation.drive(Tween(
                                          begin: Offset(1,0),
                                          end: Offset.zero)),
                                      child: _buildCard(
                                          item, context, index, animation));
                                }, duration: Duration(milliseconds: 300));
                              },
                              color: Colors.red,
                            ),
                            Text(
                              "Interested",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
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
            ],
          ),
        ));
  }
}
