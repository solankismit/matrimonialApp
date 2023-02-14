
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial_app/model/display_country_state_city_model.dart';

import '../../model/api.dart';
import '../../model/hometown_display_model.dart';

class HomeTownAlert extends StatefulWidget {
  final TextEditingController controller;


  const HomeTownAlert({Key? key, required TextEditingController this.controller}) : super(key: key);
  @override
  State<HomeTownAlert> createState() => _HomeTownAlertState();
}

class _HomeTownAlertState extends State<HomeTownAlert> {
  display_country_state_city_model statedata = display_country_state_city_model();
  // hometown_display_model statedata = hometown_display_model();
  List<String> stateList = [];
  List<String>? CountryList = [];
  List<String> CityList = [];

  String? townSelectedValue;
  String? stateSelectedValue;
  String? countrySelectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  Future<bool> loaddata() async {
    statedata = await countryDisplay().homeTownDisplayList();
    // statedata = await homeTownDisplay().homeTownDisplayList();
    setState(() {});
    // print(statedata.names?[0].name?.toString());
    CountryList = statedata.data?.map(
          (item) {
        return item.name?.toString() ?? "";
      },
    ).toList();
    return true;
  }

  void getStateData() {
    //check if the country is selected or not
    if (countrySelectedValue != null) {
      //if country is selected then get the state list
      stateList = statedata.data
          ?.where((element) => element.name == countrySelectedValue)
          .first
          .states
          ?.map((e) => e.name ?? "")
          .toList() ??
          [];
    }
  }

  void getCityData() {
    if (stateSelectedValue != null) {
      //if state is selected then get the city list
      CityList = statedata.data
          ?.where((element) => element.name == countrySelectedValue)
          .first
          .states
          ?.where((element) => element.name == stateSelectedValue)
          .first
          .cities
          ?.map((e) => e.name ?? "")
          .toList() ??
          [];
    }
    print(CountryList);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select Home Town"),
      content:  Container(
            height: 200,
     child: FutureBuilder<bool>(
    future: loaddata(),
    builder: (context, snapshot) {
    return snapshot.hasData ? Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DropdownButton(
                  menuMaxHeight:200,
                  underline: Container(
                    height: 2,
                    color: Color(0xfffeadad),
                  ),
                  hint: Text(
                    // widget.hintText,
                    "Select your country",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  isExpanded: true,
                  // items: country
                  items: CountryList?.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Column(
                      children: [
                        Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        // Divider()
                      ],
                    ),
                  )).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      countrySelectedValue = value;
                      getStateData();
                    });
                  },
                  value: countrySelectedValue,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DropdownButton(
                  underline: Container(
                    height: 2,
                    color: Color(0xfffeadad),
                  ),
                  hint: Text(
                    // widget.hintText,
                    "Select Your State",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  isExpanded: true,
                  items: stateList
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Column(
                      children: [
                        Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        // Divider()
                      ],
                    ),
                  ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      stateSelectedValue = value;
                      getCityData();
                    });
                  },
                  value: stateSelectedValue,
                  menuMaxHeight: 200,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DropdownButton(
                  menuMaxHeight: 200,
                  underline: Container(
                    height: 2,
                    color: Color(0xfffeadad),
                  ),
                  hint: Text(
                    // widget.hintText,
                    "Select Your City",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  isExpanded: true,
                  items: CityList.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Column(
                      children: [
                        Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        // Divider()
                      ],
                    ),
                  )).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      townSelectedValue = value;
                      widget.controller.text = townSelectedValue!;
                      Navigator.pop(context);
                    });
                  },
                  value: townSelectedValue,
                ),
              ),
            ]): Center(child: CircularProgressIndicator());
        }
      ),
    ));
  }
}

class CityAlert extends StatefulWidget {
  final TextEditingController statecontroller;

  final TextEditingController countrycontroller;

  final TextEditingController widgetcontroller;


  const CityAlert({Key? key, required  this.statecontroller, required TextEditingController this.countrycontroller, required TextEditingController this.widgetcontroller}) : super(key: key);
  @override
  State<CityAlert> createState() => _CityAlertState();
}

class _CityAlertState extends State<CityAlert> {
  hometown_display_model statedata = hometown_display_model();
  List<String> stateList = [];
  List<String>? CountryList = [];

  String? stateSelectedValue;
  String? countrySelectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  void loaddata() async {
    statedata = await homeTownDisplay().homeTownDisplayList();
    setState(() {});
    // print(statedata.names?[0].name?.toString());
    CountryList = statedata.data?.map(
          (item) {
        return item.name?.toString() ?? "";
      },
    ).toList();
  }

  void getStateData() {
    //check if the country is selected or not
    if (countrySelectedValue != null) {
      //if country is selected then get the state list
      stateList = statedata.data
          ?.where((element) => element.name == countrySelectedValue)
          .first
          .states
          ?.map((e) => e.name ?? "")
          .toList() ??
          [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select Home Town"),
      content: Container(
        height: 200,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: DropdownButton(
              menuMaxHeight:200,
              underline: Container(
                height: 2,
                color: Color(0xfffeadad),
              ),
              hint: Text(
                // widget.hintText,
                "Select your country",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              isExpanded: true,
              // items: country
              items: CountryList?.map((item) => DropdownMenuItem<String>(
                value: item,
                child: Column(
                  children: [
                    Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    // Divider()
                  ],
                ),
              )).toList(),
              onChanged: (String? value) {
                setState(() {
                  countrySelectedValue = value;
                  getStateData();
                });
              },
              value: countrySelectedValue,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: DropdownButton(
              underline: Container(
                height: 2,
                color: Color(0xfffeadad),
              ),
              hint: Text(
                // widget.hintText,
                "Select Your State",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              isExpanded: true,
              items: stateList
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Column(
                  children: [
                    Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    // Divider()
                  ],
                ),
              ))
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  stateSelectedValue = value;
                  widget.countrycontroller.text = countrySelectedValue! ;
                  widget.statecontroller.text = stateSelectedValue! ;
                  widget.widgetcontroller.text = countrySelectedValue! + " / "+stateSelectedValue! ;
                  Navigator.pop(context);
                  // getCityData();
                });
              },
              value: stateSelectedValue,
              menuMaxHeight: 200,
            ),
          ),
        ]),
      ),
    );
    ;
  }
}
