import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/menu_screens.dart/membership/payment_screen.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/membership_display_model.dart';
import 'package:matrimonial_app/model/membership_feature_display_model.dart'
    as feature;
import 'package:matrimonial_app/utils/routes.dart';

import 'package:matrimonial_app/widgets/gradient_button.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen>
    with TickerProviderStateMixin {
  membership_display_model membershipData = membership_display_model();
  feature.membership_feature_display_model featureData =
      feature.membership_feature_display_model();
  late List<Data> membershipList;
  late List<feature.Data> featureList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadData();
  }

  Future<membership_display_model> loadData() async {
    membershipData = await membershipDisplay().membershipDisplayList();
    featureData =
        await membershipFeatureDisplay().membershipFeatureDisplayList();
    membershipList = membershipData.data!;
    featureList = featureData.data!;
    membershipList.removeLast();
    return membershipData;
  }

  List<bool> isPresent(index) {
    List<bool> ids = [];
    for (int j = 0; j < featureList.length; j++) {
      if (membershipList[index].membershipFeatureId?[j].membershipId ==
              featureList[j].sId &&
          membershipList[index]
                  .membershipFeatureId?[j]
                  .membershipFeatureStatus ==
              true) {
        ids.add(true);
      } else {
        ids.add(false);
      }
    }
    print(ids);
    return ids;
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return FutureBuilder(
        future: loadData(),
        builder: (BuildContext context, snapshot) {
          return snapshot.hasData
              ? Scaffold(
                  body: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/bg2.png"),
                            fit: BoxFit.cover)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 30.h, left: 12.w),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () => Navigator.of(context).pop(),
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 20.w,
                          ),
                          height: 560.h,
                          width: double.maxFinite,
                          child: membershipList == null
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  clipBehavior: Clip.none,
                                  itemCount: membershipList.length,
                                  itemBuilder: (context, index) {
                                    var ids = isPresent(index);
                                    return PlannerContainer(
                                      package:
                                          (membershipList[index].planName)!,
                                      price: (membershipList[index]
                                          .planSellingPrice
                                          .toString()),
                                      // price: "₹ 3,000",
                                      perMonthPrice: (((membershipList[index]
                                                      .planSellingPrice! /
                                                  (membershipList[index]
                                                      .planDays)!) *
                                              30)
                                          .floor()
                                          .toString()),
                                      icon1: ids[0] ? Icons.check : null,
                                      icon2: ids[1] ? Icons.check : null,
                                      icon3: ids[2] ? Icons.check : null,
                                      icon4: ids[3] ? Icons.check : null,
                                      icon5: ids[4] ? Icons.check : null,
                                      features: featureList,
                                      plan: membershipList[index],
                                    );
                                  },
                                ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Center(
                            child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(MyRoutes.sparkleScreenRoute);
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.h, horizontal: 70.w),
                              child: Text(
                                "Get Sparkle",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.sp,
                                    color: Colors.black),
                              )),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0.r),
                                      side: BorderSide(
                                          color: Color(0xfffcf204))))),
                        ))
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}

class PlannerContainer extends StatelessWidget {
  String package = "";
  String price = "";
  String perMonthPrice = "";
  List<feature.Data> features = [];
  Data? plan;
  IconData? icon1;
  IconData? icon2;
  IconData? icon3;
  IconData? icon4;
  IconData? icon5;
  PlannerContainer({
    Key? key,
    required this.features,
    required this.package,
    required this.price,
    required this.perMonthPrice,
    required this.plan,
    this.icon1,
    this.icon2,
    this.icon3,
    this.icon4,
    this.icon5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List icons = [icon1, icon2, icon3, icon4, icon5];
    final screenHeight = MediaQuery.of(context).size.height;

    print(plan);
    return Container(
      margin: EdgeInsets.only(right: 15, top: 15),
      width: 350.w,
      height: 500.h,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16.r),
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.all(16.0.sm),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                package,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 16.sp),
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                  child: Divider(
                color: Colors.black26,
                height: 1.h,
                indent: 70,
                endIndent: 70,
              )),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "₹ ${price}",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 16.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "₹ $perMonthPrice per month",
                style: GoogleFonts.inter(
                    color: Colors.black38,
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                height: 200.h,
                child: ListView.builder(
                  itemCount: features.length,
                  itemBuilder: (context, index) => memberRow(
                    icon: icons[index],
                    text: features[index].featureName,
                  ),
                ),
              ),
              // memberRow(
              //   icon: icon2,
              //   text: "View upto 15 Contact Numbers",
              // ),
              // memberRow(
              //   icon: icon3,
              //   text: "Video call your Matches",
              // ),
              // memberRow(
              //   icon: icon4,
              //   text: "Standout from other Profiles",
              // ),
              // memberRow(
              //   icon: icon5,
              //   text: "Let Matches contact you directly",
              // ),
              screenHeight < 800
                  ? SizedBox(
                      height: 30.h,
                    )
                  : SizedBox(
                      height: 60.h,
                    ),
              GradientButton(
                  width: 180.w,
                  height: 60.h,
                  color1: Color(0xfffd7a8f),
                  color2: Color(0xfff653e1),
                  text: "Upgrade plan",
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PaymentScreen(
                        featureList: features,
                        plan: (plan)!,
                      );
                    }));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class memberRow extends StatelessWidget {
  IconData? icon;
  String? text = "";
  Color? color;
  memberRow({Key? key, this.icon, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 25.h,
      // margin: EdgeInsets.only(left: 20.w, bottom: 10.h),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xff32E415),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            text!,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600, fontSize: 14.sp, color: color),
          ),
        ],
      ),
    );
  }
}
