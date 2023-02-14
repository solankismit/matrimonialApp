import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial_app/model/add_family_details_model.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/display_family_details_model.dart';
import 'package:matrimonial_app/model/update_family_details_model.dart';
import 'package:matrimonial_app/utils/textfield_validators.dart';

import '../../widgets/gradient_button.dart';

class FamilyDetailsScreen extends StatefulWidget {
  const FamilyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FamilyDetailsScreen> createState() => _FamilyDetailsScreenState();
}

class _FamilyDetailsScreenState extends State<FamilyDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Family Details',
            style: TextStyle(
                fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Untitled.png"),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    child: FamilyDetailsWidget()))));
  }
}

class FamilyDetailsWidget extends StatefulWidget {
  const FamilyDetailsWidget({Key? key}) : super(key: key);

  @override
  State<FamilyDetailsWidget> createState() => _FamilyDetailsWidgetState();
}

class _FamilyDetailsWidgetState extends State<FamilyDetailsWidget> with SingleTickerProviderStateMixin {

  AnimationController? _controller;
  Animation? _contentAnimation;
  TextEditingController noOfBrother = TextEditingController(text: null);
  TextEditingController MarriedBrother = TextEditingController(text: '0');
  TextEditingController MarriedSister = TextEditingController(text: '0');
  TextEditingController noOfSister = TextEditingController(text: null) ;
  TextEditingController _motheroccupation = TextEditingController(text: null) ;
  TextEditingController _fatheroccupation = TextEditingController(text: null) ;
  bool details_exists = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
    // _controller =
    //     AnimationController(vsync: this, duration: Duration(seconds: 4));
    // _contentAnimation = Tween(begin: 0.0, end: 18.0).animate(CurvedAnimation(
    //     parent: _controller!,
    //     curve: Interval(0.20, 0.40, curve: Curves.linear)));
    // _controller?.forward();
    // _controller?.addListener(() {
    //   setState(() {});});
  }

  void loaddata(){
    familyDisplay().familyDisplayList().then((value) {
      setState(() {
        if(value.data != null){
          details_exists = true;
          _motheroccupation.text = value.data!.motherOccupation!;
          _fatheroccupation.text = value.data!.fatherOccupation!;
          noOfBrother.text = value.data!.noOfBrother.toString();
          noOfSister.text = value.data!.noOfSister.toString();
          MarriedBrother.text = value.data!.noOfMarriedBrother.toString();
          MarriedSister.text = value.data!.noOfMarriedSister.toString();
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    print(noOfSister);
    double screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder<display_family_details_model>(
      future: familyDisplay().familyDisplayList(),
      builder:(context, snapshot) {
        if(snapshot.hasData){
          var data = snapshot.data?.data;
          if(data != null && snapshot.data?.message=="family_data"){
            details_exists = true;
          }
          else{
            details_exists = false;
          }
        }
      return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(top: screenHeight * 0.1, left: 20, right: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              screenHeight < 800 ? SizedBox(height: 40.h) : SizedBox(height: 90.h),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                    //Add Fathers Occupation
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fathers Occupation',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xff3C0A53),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          height: 50.h,
                          width: 350.w,
                          child: TextField(
                            controller: _fatheroccupation,
                            decoration: InputDecoration(
                                // border: InputBorder.none,
                                hintText: 'Fathers Occupation',
                                hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color(0xff3C0A53).withOpacity(0.5),
                                    fontWeight: FontWeight.w600),
                                contentPadding: EdgeInsets.only(left: 20.w)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mothers Occupation',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xff3C0A53),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          height: 50.h,
                          width: 350.w,
                          child: TextField(
                            controller: _motheroccupation,
                            decoration: InputDecoration(
                                // border: InputBorder.none,
                                hintText: 'Mothers Occupation',
                                hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color(0xff3C0A53).withOpacity(0.5),
                                    fontWeight: FontWeight.w600),
                                contentPadding: EdgeInsets.only(left: 20.w)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    _buildrow('Number of Brothers', noOfBrother, ['0', '1', '2', '3', '4', '5'],noOfBrother.text=='' ? null : noOfBrother.text),
                    (int.parse(noOfBrother.text==''?'0' : noOfBrother.text)>0) ?_buildrow('Number of Married\nBrothers', MarriedBrother,createList(int.parse(noOfBrother.text)), MarriedBrother.text=='' ? null : MarriedBrother.text):SizedBox(),
                    _buildrow('Number of Sisters', noOfSister, ['0', '1', '2', '3', '4', '5'],noOfSister.text=='' ? null : noOfSister.text),
                    (int.parse(noOfSister.text==''?'0' : noOfSister.text)>0) ?(_buildrow('Number of Married \nSisters', MarriedSister,createList(int.parse(noOfSister.text)), MarriedSister.text=='' ? null : MarriedSister.text)):SizedBox(),
              ]),
              SizedBox(height: 20.h),
              GradientButton(
                  height: 50.h,
                  // color1: Color(int.parse("3c0a53", radix: 16) + 0xFF000000),
                  color2: Color(int.parse("b88dcd", radix: 16) + 0xFF000000),
                  color1: Color(int.parse("7e5f8d", radix: 16) + 0xFF000000),
                  text: "Save",
                  onPressed: () async{
                    //TODO: Save Changes
                    if(validateEmptyField([_motheroccupation,_fatheroccupation,noOfBrother,noOfSister], context)) {
                      dynamic pref_check =
                          await _savepreferences(
                              _fatheroccupation.text,
                              _motheroccupation.text,
                              int.parse(noOfBrother.text),
                              int.parse(MarriedBrother.text),
                              int.parse(noOfSister.text),
                              int.parse(MarriedSister.text),details_exists);
                      if (pref_check.message.toString() ==
                          "family_data added") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Family Details Saved")));
                        Navigator.pop(context);
                      } else if (pref_check.message.toString() ==
                          "family_data updated") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Family Details Updated")));
                        Navigator.pop(context);
                      } else {
                        print("Error in saving preferences");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(pref_check.message.toString())));
                      }
                    }
                  }),
            ])),
      );},
    );
  }


  Future<dynamic> _savepreferences(String father_occupation,
      String mother_occupation,
      int no_of_brother,
       int no_of_married_brother,
       int no_of_sister,
       int no_of_married_sister,
      bool exists
      ) async {
    if(!exists){
      add_family_details_model addfamily = await familyAdd().familyList(
          father_occupation: father_occupation,
          no_of_brother: no_of_brother,
          no_of_sister: no_of_sister,
          no_of_married_brother: no_of_married_brother,
          no_of_married_sister: no_of_married_sister,
          mother_occupation: mother_occupation);
      return addfamily;
    }
    else{
      update_family_details_model updatefamily = await familyUpdate().familyUpdateList(
          father_occupation: father_occupation,
          no_of_brother: no_of_brother,
          no_of_sister: no_of_sister,
          no_of_married_brother: no_of_married_brother,
          no_of_married_sister: no_of_married_sister,
          mother_occupation: mother_occupation);
      return updatefamily;
    }
  }
  Widget _buildrow(String text, TextEditingController dropdownValue, List<String> list,val,
      {double fontsize = 18.0}) {
    // String? dropdownValue1 ;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: fontsize,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,

              ),
            ),
          ),
          Container(
            width: 80,
            child: //Add DropDown for Number till 5
            DropdownButton<String>(
              alignment: Alignment.center,
              value: val,
              hint: const Text('Select'),
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              style:  TextStyle(color: Colors.black , fontSize: fontsize),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue.text = newValue!;
                });
              },
              items: list
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
  List<String> createList(int n) {
    List<String> list = [];
    for (int i = 0; i <= n; i++) {
      list.add(i.toString());
    }
    return list;
  }
}
