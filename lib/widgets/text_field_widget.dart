import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  final String fieldLabel;
  final TextEditingController? textEditingController;
  IconData? icon;
  Function? onTap ;
  bool? isEnable = true;
  TextInputType? textInputType;
  TextFieldWidget({
    Key? key,
    required this.fieldLabel,
    this.icon,
    this.textEditingController,
    this.onTap,
    this.isEnable,
    this.textInputType,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    onTap ??= (){};
    isEnable ??= false;
    return Container(
      height: screenHeight < 800 ? 50 : null,
      margin: screenHeight < 800
          ? EdgeInsets.symmetric(horizontal: 10.w)
          : EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(1.0.sm),
      child: TextFormField(
        readOnly: isEnable! ,
        keyboardType: textInputType ?? TextInputType.text,
        // enabled: isEnable,
        onTap: () async{print("onTap"); onTap!();},
        controller: textEditingController,
        style: TextStyle(fontSize: 12.sp),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xfffeadad),
              width: 4.w,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xfffeadad),
              width: 4.w,
            ),
          ),
          // prefixIcon: Icon(
          //   icon,
          //   color: Colors.black,
          // ),
          label: Text(fieldLabel),
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
