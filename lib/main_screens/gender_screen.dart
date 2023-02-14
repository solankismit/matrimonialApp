import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/utils/textfield_validators.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:matrimonial_app/main_screens/height_screen.dart';
import 'package:matrimonial_app/widgets/drop_down_widget.dart';
import 'package:intl/intl.dart';
import '../utils/routes.dart';
import '../widgets/gradient_button.dart';
import '../widgets/text_field_widget.dart';
import 'height_screen.dart';

class GenderScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  const GenderScreen({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  List<bool> isSelected = [false, true];
  String gender = "Female";
  final TextEditingController ageEditingController = TextEditingController();
  final TextEditingController dobEditingController = TextEditingController();
  final TextEditingController weightEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    print(widget.firstName);
    print(widget.lastName);
    print(widget.phoneNumber);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg1.png"), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 310.h),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.w),
                    padding: EdgeInsets.all(10.0),
                    child: Text("Find precisely \nthe right character for you",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kristi(
                          textStyle: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.3),
                        )),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  child: const Text(
                    "Select your gender",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.black45),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                  ),
                  child: ToggleButtons(
                      fillColor:
                          isSelected[0] ? Color(0xffb1ddef) : Color(0xfff5b9ff),
                      borderWidth: 0,
                      onPressed: (val) {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            if (i == val) {
                              isSelected[i] = true;
                            } else {
                              isSelected[i] = false;
                            }
                            print(isSelected[i]);
                          }
                          isSelected[0] == true
                              ? gender = "Male"
                              : gender = "Female";
                        });
                        print(gender);
                      },
                      isSelected: isSelected,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            // margin: EdgeInsets.all(10),
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/men.png",
                              width: 50.w,
                              height: 50.h,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/women.png",
                                width: 50.w, height: 50.h),
                          ),
                        )
                      ]),
                ),
                TextFieldWidget(
                    fieldLabel: 'Weight',
                    textEditingController: weightEditingController,
                textInputType: TextInputType.number,
                onTap: (){
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                },),
                // ToggleSwitch(
                //   minWidth: 90.0,
                //   initialLabelIndex: 1,
                //   // cornerRadius: 20.0,
                //   activeFgColor: Colors.white,
                //   inactiveBgColor: Colors.grey,
                //   inactiveFgColor: Colors.white,
                //   totalSwitches: 2,
                //   labels: ['Male', 'Female'],
                //   // icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                //   activeBgColors: [
                //     [Colors.blue],
                //     [Colors.pink]
                //   ],
                //   onToggle: (index) {
                //     print('switched to: $index');
                //   },
                // ),

                Container(
                  height: 50.h,
                  // width: 200.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: TextFieldWidget(
                          fieldLabel: "Date Of Birth",
                          textEditingController: dobEditingController,
                          isEnable: true,
                          onTap: () async {
                            print("On Tapped on Age");
                            DateTime? pickedDate = await showDatePicker(
                              fieldLabelText: "Date Of Birth",
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(
                                    1910), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate);
                              setState(() {
                                dobEditingController.text = formattedDate;
                                //find age from date of birth
                                DateTime birthDate = DateTime.parse(formattedDate);
                                DateTime currentDate = DateTime.now();
                                int age = currentDate.year - birthDate.year;
                                int month1 = currentDate.month;
                                int month2 = birthDate.month;
                                if (month2 > month1) {
                                  age--;
                                } else if (month1 == month2) {
                                  int day1 = currentDate.day;
                                  int day2 = birthDate.day;
                                  if (day2 > day1) {
                                    age--;
                                  }
                                }
                                dobEditingController.text = formattedDate;
                                ageEditingController.text = age.toString();
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Flexible(
                        flex: 1,
                        child: TextFieldWidget(
                          fieldLabel: "Age",
                          textEditingController: ageEditingController,
                          isEnable: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30.w),
                  child: Text(
                    "I trust your birthday gives you numourous cheerful recollection!",
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                ),
                screenHeight < 800
                    ? SizedBox(
                        height: 10.h,
                      )
                    : SizedBox(
                        height: 100.h,
                      ),
                Center(
                    child: GradientButton(
                        width: 280.w,
                        height: 50.h,
                        color1: Color(0xfffd7a8f),
                        color2: Color(0xfff653e1),
                        text: "Continue",
                        onPressed: () {
                          if (validateEmptyField([
                            ageEditingController,
                            weightEditingController,
                            dobEditingController
                          ],context)) {
                            if(validateAge(int.parse(ageEditingController.text),context) && validateWeight(int.parse(weightEditingController.text),context)){
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => HeightScreen(
                                            isSelected: isSelected,
                                            email: widget.email,
                                            firstName: widget.firstName,
                                            lastName: widget.lastName,
                                            phoneNumber: widget.phoneNumber,
                                            gender: gender,
                                            age: ageEditingController.text,
                                            dob: dobEditingController.text,
                                            weight: int.parse(
                                                weightEditingController.text),
                                          )));
                            }
                          }
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
