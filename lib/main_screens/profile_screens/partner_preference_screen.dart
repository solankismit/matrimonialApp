import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial_app/model/add_partner_preference_model.dart';
import 'package:matrimonial_app/widgets/alertbox_widgets/diet_alert.dart';
import 'package:matrimonial_app/widgets/alertbox_widgets/height_alert.dart';
import 'package:matrimonial_app/widgets/alertbox_widgets/hometown_alert.dart';

import '../../model/api.dart';
import '../../model/salary_display_model.dart';
import '../../model/update_partner_preference_model.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/multi_select_dropdown.dart';

class PartnerPreferenceScreen extends StatefulWidget {
  const PartnerPreferenceScreen({Key? key}) : super(key: key);

  @override
  State<PartnerPreferenceScreen> createState() =>
      _PartnerPreferenceScreenState();
}

class _PartnerPreferenceScreenState extends State<PartnerPreferenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Partner Preference',
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
                    child: PartnerPreferenceWidget()))));
  }
}

class PartnerPreferenceWidget extends StatefulWidget {
  PartnerPreferenceWidget({Key? key}) : super(key: key);

  @override
  State<PartnerPreferenceWidget> createState() =>
      _PartnerPreferenceWidgetState();
}

class _PartnerPreferenceWidgetState extends State<PartnerPreferenceWidget> {
  bool is_exists = false;
  List<String> _selectedreligions = [];
  List<String> _selectedlanguages = [];

  TextEditingController _statecontroller = TextEditingController();
  TextEditingController _countrycontroller = TextEditingController();
  TextEditingController _statewidgetcontroller = TextEditingController();
  TextEditingController _dietcontroller = TextEditingController();
  TextEditingController _smokecontroller = TextEditingController();
  TextEditingController _drinkcontroller = TextEditingController();
  TextEditingController _dietwidgetcontroller = TextEditingController();

  String? minage,
      maxage,
      minheight,
      maxheight,
      maritalstatus,
      salarySelected,
      id;

  salary_display_model salaryData = salary_display_model();
  List<String> salaryList = [];
  List<String> mothertongue = [
    'Hindi',
    'English',
    'Bengali',
    'Telugu',
    'Marathi',
    'Tamil',
    'Urdu',
    'Gujarati',
    'Kannada',
    'Malayalam',
    'Oriya',
    'Punjabi',
    'Assamese',
    'Sindhi',
    'Kashmiri',
    'Konkani',
    'Nepali',
    'Manipuri',
    'Sanskrit',
    'Maithili'
  ];

  List<String> religion = [
    'Hindu',
    'Muslim',
    'Sikh',
    'Christian',
    'Jain',
    'Buddhist',
    'Parsi',
    'Jewish',
    'Spiritual',
    'No Religion'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  void loaddata() async {
    salaryData = await salaryDisplay().salaryDisplayList();
    setState(() {});
    salaryList = salaryData.data!.map((item) => item.salaryValue!).toList();
    partnerpreferenceDisplay().preferenceDisplayList().then((value) => {
          setState(() {
            if (value.data != null) {
              _selectedreligions = value.data?[0].religion?.toList() ?? [];
              _selectedlanguages = value.data?[0].language! ?? [];
              // _countrycontroller.text = value.data?[0].country!;
              _statewidgetcontroller.text = value.data?[0].location! ?? "";
              _dietcontroller.text = value.data?[0].foodPreferences! ?? "";
              _smokecontroller.text = value.data?[0].smoke! ?? "";
              _drinkcontroller.text = value.data?[0].drink! ?? "";
              _dietwidgetcontroller.text =
                  ("${value.data?[0].foodPreferences!} / ${value.data?[0].smoke!} / ${value.data?[0].drink!}") ??
                      '';
              minage = value.data?[0].minAge!.toString() ?? "0";
              maxage = value.data?[0].maxAge!.toString();
              minheight = value.data?[0].minHeight!;
              maxheight = value.data?[0].maxHeight!;
              maritalstatus = value.data?[0].maritalStatus!;
              salarySelected = value.data?[0].annualIncome! ?? "";
              id = value.data?[0].sId! ?? "";
              is_exists = true;
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return
        // FutureBuilder(
        // future:
        // builder:
        Container(
            margin:
                EdgeInsets.only(top: screenHeight * 0.1, left: 20, right: 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    screenHeight < 800
                        ? SizedBox(height: 60.h)
                        : SizedBox(height: 110.h),
                    SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Expanded(
                                child: Text('Age',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                              ),
                              SizedBox(width: 10.w),
                              //Add age dropdown
                              DropdownButton<String>(
                                hint: Text('From'),
                                icon: const Icon(Icons.arrow_drop_down),
                                value: minage,
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.black,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    this.minage = newValue;
                                  });
                                },
                                items: List.generate(
                                        83, (index) => (index + 18).toString())
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              SizedBox(width: 10.w),
                              DropdownButton<String>(
                                hint: Text('To'),
                                icon: const Icon(Icons.arrow_drop_down),
                                value: maxage,
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.black,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    this.maxage = newValue;
                                  });
                                },
                                items: List.generate(
                                        83,
                                        (index) => (index +
                                                int.parse(minage ?? "18") +
                                                1)
                                            .toString())
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    enabled: int.parse(value) >
                                        int.parse(minage ?? "18"),
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )
                            ]),
                            SizedBox(height: 20.h),
                            //  Add Height dropdown
                            Row(children: [
                              Expanded(
                                child: Text('Height',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                              ),
                              SizedBox(width: 10.w),
                              DropdownButton<String>(
                                hint: Text('From'),
                                icon: const Icon(Icons.arrow_drop_down),
                                value: minheight,
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.black,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    this.minheight = newValue;
                                  });
                                },
                                items: heightList.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              SizedBox(width: 10.w),
                              DropdownButton<String>(
                                hint: Text('To'),
                                icon: const Icon(Icons.arrow_drop_down),
                                value: maxheight,
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.black,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    this.maxheight = newValue;
                                  });
                                },
                                items: heightList
                                    .sublist(
                                        heightList.indexOf(minheight ?? "4’0”"))
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    enabled: heightList.indexOf(value) >
                                        heightList
                                            .indexOf(minheight ?? "4'0\""),
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )
                            ]),
                            SizedBox(height: 20.h),
                            //  Add Dropdown for Marital Status
                            Row(children: [
                              Expanded(
                                child: Text('Marital Status',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                              ),
                              SizedBox(width: 10.w),
                              DropdownButton<String>(
                                hint: Text('Select'),
                                icon: const Icon(Icons.arrow_drop_down),
                                value: maritalstatus ?? null,
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.black,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    this.maritalstatus = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Never Married',
                                  'Divorced',
                                  'Widowed'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ]),
                            SizedBox(height: 20.h),
                            //  Add Dropdown for Religion
                            Row(children: [
                              Expanded(
                                child: Text('Religion',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                              ),
                              SizedBox(width: 10.w),
                              SizedBox(
                                width: 110.w,
                                child: TextField(
                                    // controller: _statewidgetcontroller,
                                    decoration: InputDecoration(
                                      hintText: 'Select',
                                    ),
                                    style: TextStyle(fontSize: 14),
                                    readOnly: true,
                                    onTap: () {
                                      _showMultiSelect(religion, 0);
                                    }),
                              ),
                              // DropdownButton<String>(
                              //   hint: Text('Select'),
                              //   icon: const Icon(Icons.arrow_drop_down),
                              //   value: null,
                              //   iconSize: 24,
                              //   elevation: 16,
                              //   style: const TextStyle(color: Colors.black),
                              //   underline: Container(
                              //     height: 2,
                              //     color: Colors.black,
                              //   ),
                              //   onChanged: (String? newValue) {
                              //     setState(() {
                              //       this.fromValue = newValue;
                              //     });
                              //   },
                              //   items: <String>[
                              //     'Hindu',
                              //     'Muslim',
                              //     'Sikh',
                              //     'Christian',
                              //     'Jain',
                              //     'Buddhist',
                              //     'Parsi',
                              //     'Jewish',
                              //     'Spiritual',
                              //     'No Religion'
                              //   ].map<DropdownMenuItem<String>>((String value) {
                              //     return DropdownMenuItem<String>(
                              //       value: value,
                              //       child: Text(value),
                              //     );
                              //   }).toList(),
                              // ),
                            ]),
                            Wrap(
                              spacing: 1.5,
                              children: _selectedreligions
                                  .map((e) => Chip(
                                        label: Text(e),
                                      ))
                                  .toList(),
                            ),
                            SizedBox(height: 20.h),
                            // Add Dropdown for Mother Tongue
                            Row(children: [
                              Expanded(
                                child: Text('Mother Tongue',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                              ),
                              SizedBox(width: 10.w),
                              SizedBox(
                                width: 110.w,
                                child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Select',
                                    ),
                                    style: TextStyle(fontSize: 14),
                                    readOnly: true,
                                    onTap: () {
                                      _showMultiSelect(mothertongue, 1);
                                    }),
                              ),
                              // DropdownButton<String>(
                              //   hint: Text('Select'),
                              //   icon: const Icon(Icons.arrow_drop_down),
                              //   value: null,
                              //   iconSize: 24,
                              //   elevation: 16,
                              //   style: const TextStyle(color: Colors.black),
                              //   underline: Container(
                              //     height: 2,
                              //     color: Colors.black,
                              //   ),
                              //   onChanged: (String? newValue) {
                              //     setState(() {
                              //       this.fromValue = newValue;
                              //     });
                              //   },
                              //   items: <String>[
                              //     'Hindi',
                              //     'English',
                              //     'Bengali',
                              //     'Telugu',
                              //     'Marathi',
                              //     'Tamil',
                              //     'Urdu',
                              //     'Gujarati',
                              //     'Kannada',
                              //     'Malayalam',
                              //     'Oriya',
                              //     'Punjabi',
                              //     'Assamese',
                              //     'Sindhi',
                              //     'Kashmiri',
                              //     'Konkani',
                              //     'Nepali',
                              //     'Manipuri',
                              //     'Sanskrit',
                              //     'Maithili'
                              //   ].map<DropdownMenuItem<String>>((String value) {
                              //     return DropdownMenuItem<String>(
                              //       value: value,
                              //       child: Text(value),
                              //     );
                              //   }).toList(),
                              // ),
                            ]),
                            Wrap(
                              spacing: 1.5,
                              children: _selectedlanguages
                                  .map((e) => Chip(
                                        label: Text(e),
                                      ))
                                  .toList(),
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                Expanded(
                                    child: Text("Annual Income",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                                SizedBox(
                                  width: 10.w,
                                ),
                                DropdownButton<String>(
                                  hint: Text('Select'),
                                  icon: const Icon(Icons.arrow_drop_down),
                                  value: salarySelected,
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.black,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      this.salarySelected = newValue;
                                    });
                                  },
                                  items: salaryList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                            SizedBox(height: 20.h),
                            // Add Country and State Living in Selector
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Country/State Living In',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(width: 10.w),
                                  SizedBox(
                                    width: 280.w,
                                    child: TextField(
                                        controller: _statewidgetcontroller,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Select Country/State Living In',
                                        ),
                                        readOnly: true,
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CityAlert(
                                                  statecontroller:
                                                      _statecontroller,
                                                  countrycontroller:
                                                      _countrycontroller,
                                                  widgetcontroller:
                                                      _statewidgetcontroller,
                                                );
                                              });
                                        }),
                                  ),
                                ]),
                            SizedBox(height: 20.h),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Diet / Smoke / Drink',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(width: 10.w),
                                  SizedBox(
                                    width: 280.w,
                                    child: TextField(
                                        controller: _dietwidgetcontroller,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Select Diet / Smoke / Drink',
                                          // labelText: 'Country/State Living In',
                                        ),
                                        readOnly: true,
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return DietAlert(
                                                    smokecontroller:
                                                        _smokecontroller,
                                                    drinkcontroller:
                                                        _drinkcontroller,
                                                    dietcontroller:
                                                        _dietcontroller,
                                                    widgetcontroller:
                                                        _dietwidgetcontroller);
                                              });
                                        }),
                                  ),
                                  SizedBox(height: 40.h),
                                  GradientButton(
                                      height: 50.h,
                                      // color1: Color(int.parse("3c0a53", radix: 16) + 0xFF000000),
                                      color2: Color(
                                          int.parse("b88dcd", radix: 16) +
                                              0xFF000000),
                                      color1: Color(
                                          int.parse("7e5f8d", radix: 16) +
                                              0xFF000000),
                                      text: "Save",
                                      onPressed: () async {
                                        //TODO: Save Changes
                                        dynamic
                                            pref_check = await _savepreferences(
                                                is_exists,
                                                int.parse(minage!),
                                                int.parse(maxage!),
                                                minheight!,
                                                maxheight!,
                                                _selectedreligions,
                                                _selectedlanguages,
                                                _countrycontroller.text,
                                                _statewidgetcontroller.text,
                                                _dietcontroller.text,
                                                _smokecontroller.text,
                                                _drinkcontroller.text,
                                                salarySelected!,
                                                maritalstatus!);
                                        if (pref_check.message.toString() ==
                                            "preference_data added") {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Preferences Saved Successfully")));
                                          Navigator.pop(context);
                                        } else if (pref_check.message
                                                .toString() ==
                                            "update_preference_data") {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Preference Updated ")));
                                          Navigator.pop(context);
                                        } else {
                                          print("Error in saving preferences");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(pref_check
                                                      .message
                                                      .toString())));
                                        }
                                      }),
                                ]),
                            SizedBox(
                              height: 20.h,
                            )
                          ]),
                    )
                  ]),
            )
            // ),
            );
  }

  void _showMultiSelect(List<String> items, int widgetnum) async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        if (widgetnum == 0) {
          _selectedreligions = results;
        } else {
          _selectedlanguages = results;
        }
      });
    }
  }

  Future<dynamic> _savepreferences(
      bool is_exist,
      int minage,
      int maxage,
      String minHeight,
      String maxHeight,
      List<String> religion,
      List<String> language,
      String country,
      String state,
      String diet,
      String smoke,
      String drink,
      String salary,
      String maritalstatus,
      {String id = ''}) async {
    if (is_exists) {
      update_partner_preference_model updateprefs =
          await partnerpreferenceUpdate().preferenceUpdateList(
              religion: religion,
              language: language,
              location: state,
              food_prefs: diet,
              smoke: smoke,
              drink: drink,
              annual_income: salary,
              maritalstatus: maritalstatus,
              min_age: minage,
              max_age: maxage,
              min_height: minHeight,
              max_height: maxHeight,
              id: id);
      return updateprefs;
    } else {
      add_partner_preference_model partnerpreference =
          await preferenceAdd().prefList(
        religion: religion,
        language: language,
        location: state,
        food_prefs: diet,
        smoke: smoke,
        drink: drink,
        annual_income: salary,
        maritalstatus: maritalstatus,
        min_age: minage,
        max_age: maxage,
        min_height: minHeight,
        max_height: maxHeight,
      );

      // if(partnerpreference.message == "preference_data added"){
      return partnerpreference;
    }
  }
}
