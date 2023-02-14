import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/utils/sharedprefsData.dart';
import 'package:matrimonial_app/widgets/gradient_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  String phone_number = '+919998441580';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();

  }

  void loaddata() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phone_number = prefs.getString(sharedPrefsData.phoneNo)!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg2.png"), fit: BoxFit.cover)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Container(
                padding: EdgeInsets.only(top: 30.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: () => Navigator.of(context).pop(),
                              color: Colors.black),
                          Text(
                            "Card",
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                      Text(
                        phone_number,
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45),
                    ),
      ]
                ),
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 50,
                                )),
                          ),
                          Text("Add New Card",
                              style: GoogleFonts.poppins(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 50,
                                )),
                          ),
                        ]),
                        SizedBox(
                          height: 70.h,
                        ),
                        //Add Text Field
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Column(
                            children: [
                              Container(
                                // margin: EdgeInsets.only(left: 12.w, right: 12.w),
                                height: 50.h,
                                width: 300.w,
                                child: TextFormField(
                                  controller: cardHolderNameController,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    hintText: 'Name on Card',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              //Add Text Field
                              Container(
                                // margin: EdgeInsets.only(left: 12.w, right: 12.w),
                                height: 50.h,
                                width: 300.w,
                                child: TextFormField(
                                  controller: cardNumberController,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    hintText: 'Card Number',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //Add Text Field
                                  Container(
                                    // margin: EdgeInsets.only(left: 12.w, right: 12.w),
                                    height: 50.h,
                                    width: 150.w,
                                    child: TextFormField(
                                      controller: expiryDateController,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                        hintText: 'MM/YY',
                                      ),
                                    ),
                                  ),
                                  //Add Text Field
                                  Container(
                                    // margin: EdgeInsets.only(left: 12.w, right: 12.w),
                                    height: 50.h,
                                    width: 150.w,
                                    child: TextFormField(
                                      controller: cvvController,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                        hintText: 'CVV',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              //Add Button
                              GradientButton(
                                  color1: Color(0xfffd7a8f),
                                  color2: Color(0xfff653e1),
                                  height: 50.h,
                                  width: 300.w,
                                  text: "Proceed", onPressed: (){})
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              )
            ])));
  }
}
