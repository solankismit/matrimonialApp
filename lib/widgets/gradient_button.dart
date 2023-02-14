import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;

  final Color color1;
  final Color color2;
  final String text;
  double? width;
  double? height;
  GradientButton(
      {Key? key,
      required this.color1,
      required this.color2,
      required this.text,
      required this.onPressed,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(30)),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Text(text,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    letterSpacing: 0.3),
              )),
        ),
      ),
    );
  }
}
