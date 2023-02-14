import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/menu_screens.dart/membership/add_card_screen.dart';
import 'package:matrimonial_app/menu_screens.dart/membership/membership_screen.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/membership_display_model.dart';
import 'package:matrimonial_app/model/membership_feature_display_model.dart'
as feature;
import 'package:matrimonial_app/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matrimonial_app/widgets/gradient_button.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key,required this.plan,required this.featureList}) : super(key: key);

  Data plan;
  List<feature.Data> featureList;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {
  String plan_name = 'Silver Plan';
  String plan_price = '₹ 1000';
  List<feature.Data>? featureList;
  Data? PlanData;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    featureList = [];
    plan_name = (widget.plan.planName)!;
    plan_price = (widget.plan.planSellingPrice)!.toString();
    PlanData = widget.plan;
    for(int i=0;i<widget.featureList.length;i++){
      print("HII ${PlanData?.membershipFeatureId?[i].membershipFeatureStatus}");
      if(PlanData?.membershipFeatureId?[i].membershipFeatureStatus == true){
        featureList?.add(widget.featureList[i]);
        print(featureList?.length);
        print("IF IN PAYMENT SCREEN");
      }
    }
    print(featureList?.length);

    // featureList?.removeLast();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 12.w, right: 12.w),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg2.png"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30.h),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.of(context).pop(),
                    color: Colors.black,
                  ),
                  Text(
                    "Purchase Plan",
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            //Add small text
            Container(
              padding: EdgeInsets.only(left: 12.w),
              child: Text(
                "You have Subscribed to ",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            _planCard(),
            SizedBox(
              height: 50.h,
            ),
            Column(
              children: [
                Text("Select Payment Method"),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    print("INKWELL CARD PAYMENT");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCardScreen()));
                    // Navigator.pushNamed(context, MyRoutes.paymentSuccess);
                  },
                  // splashFactory: InkRipple.splashFactory.create(controller: , referenceBox: referenceBox, position: position, color: color, textDirection: textDirection),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.creditCard,
                              color: Colors.purpleAccent.shade100, size: 30.sp),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text("Card",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),)
                        ],
                      ),
                      //Add Vertical thin line
                      Container(
                        margin: EdgeInsets.only(left: 20.w, right: 20.w),
                        height: 50.h,
                        width: 1.w,
                        color: Colors.black38,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/payment/rupay.png",height: 70.h,width: 70.w,),
                          Image.asset("assets/payment/mastercard.png",height: 55.h,width: 55.w,),
                          Image.asset("assets/payment/visa.png",height: 55.h,width: 55.w,),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text("OR"),
                Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                        child: Divider(
                          color: Colors.black,
                          height: 50,
                        )),
                  ),

                  Text("Pay with set up app"),

                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                        child: Divider(
                          color: Colors.black,
                          height: 50,
                        )),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Image.asset("assets/payment/gpay.png",height: 70.h,width: 70.w,),
                    Image.asset("assets/payment/phonepe.png",height: 70.h,width: 70.w,),
                    Image.asset("assets/payment/paytm.png",height: 70.h,width: 70.w,),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    margin: EdgeInsets.only(left: 42.w, right: 12.w),
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.bank,color: Colors.purpleAccent.shade100,size: 30.sp,),
                        TextButton(onPressed: (){}, child: Text("Netbanking",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold)),),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Membership Display Model Data passed in this
  Widget _planCard() {
    return Container(
      margin: EdgeInsets.only(left: 12.w, right: 12.w),
      height: 210.h,
      width: double.maxFinite,
      //Soft Edget with pink background
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 17.w, right: 17.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    plan_name,
                    style: GoogleFonts.poppins(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                Text(
                  "₹ $plan_price",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 20.h,
          // ),
          Container(
            padding: EdgeInsets.only(left: 17.w, right: 17.w),
            height: 150.h,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 17.w, right: 17.w),
            child: ListView.builder(
              // padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: featureList?.length,
              itemBuilder: (context, index) {
                return memberRow(text: featureList?[index].featureName,color: Colors.white,icon: Icons.check,);
              },),
          ),
        ],
      ),
    );
  }
}
