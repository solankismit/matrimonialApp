
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/api.dart';
import '../../model/drink_display_model.dart';
import '../../model/food_preference_display_model.dart';
import '../../model/hometown_display_model.dart';
import '../../model/smoke_display_model.dart';

class DietAlert extends StatefulWidget {
  final TextEditingController smokecontroller;
  final TextEditingController drinkcontroller;
  final TextEditingController dietcontroller;
  final TextEditingController widgetcontroller;

  const DietAlert({Key? key, required this.smokecontroller, required this.drinkcontroller, required this.dietcontroller, required  this.widgetcontroller}) : super(key: key);
  @override
  State<DietAlert> createState() => _DietAlertState();
}

class _DietAlertState extends State<DietAlert> {
  food_preference_display_model foodpreferenceData = food_preference_display_model();
  smoke_display_model smokeData = smoke_display_model();
  drink_display_model drinkData = drink_display_model();
  List<String> foodPreferenceList = [];
  List<String> smokeList = [];
  List<String> drinkList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void loadData() async {
    foodpreferenceData = await foodPreferenceDisplay().foodPreferenceDisplayList();
    smokeData = await smokeDisplay().smokeDisplayList();
    drinkData = await drinkDisplay().drinkDisplayList();
    setState(() {});
    foodPreferenceList =
        foodpreferenceData.data!.map((item) => item.fpName!).toList();

    smokeList = smokeData.data!.map((item) => item.smokeValue!).toList();

    drinkList = drinkData.data!.map((item) => item.drinkValue!).toList();
  }

  String? foodSelectedValue;
  String? smokeSelectedValue;
  String? drinkSelectedValue;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text(),
      content: Container(
        height: 200,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: DropdownButton<String>(
              menuMaxHeight:200,
              underline: Container(
                height: 2,
                color: Color(0xfffeadad),
              ),
              hint: Text(
                // widget.hintText,
                "Select Diet",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              isExpanded: true,
              // items: country
              items: foodPreferenceList.map((item) => DropdownMenuItem<String>(
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
                  foodSelectedValue = value;
                });
              },
              value: foodSelectedValue,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: DropdownButton<String>(
              underline: Container(
                height: 2,
                color: Color(0xfffeadad),
              ),
              hint: Text(
                // widget.hintText,
                "Smoke",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              isExpanded: true,
              items: smokeList
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
                  smokeSelectedValue = value;
                });
              },
              value: smokeSelectedValue,
              menuMaxHeight: 200,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: DropdownButton<String>(
              menuMaxHeight: 200,
              underline: Container(
                height: 2,
                color: Color(0xfffeadad),
              ),
              hint: Text(
                // widget.hintText,
                "Drink",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              isExpanded: true,
              items: drinkList.map((item) => DropdownMenuItem<String>(
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
                  drinkSelectedValue = value;
                  widget.dietcontroller.text = foodSelectedValue!;
                  widget.drinkcontroller.text = drinkSelectedValue!;
                  widget.smokecontroller.text = smokeSelectedValue!;
                  widget.widgetcontroller.text = "${foodSelectedValue!} / ${smokeSelectedValue!} / ${drinkSelectedValue!}";
                  Navigator.pop(context);
                });
              },
              value: drinkSelectedValue,
            ),
          ),
        ]),
      ),
    );
    ;
  }
}