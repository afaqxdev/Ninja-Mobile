import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.buttonname,
    required this.color,
    required this.onPressed,
    this.textcolor,
    this.textsize,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  final Color color;
  final String buttonname;
  final VoidCallback onPressed;
  final Color? textcolor;
  final double? textsize;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 250.w,
      height: height,
      child: MaterialButton(
        height: 40.h,
        minWidth: double.infinity,
        onPressed: onPressed,
        color: color,
        child: Text(
          buttonname,
          style: TextStyle(
            color: textcolor ?? Colors.black,
            fontSize: textsize ?? 19.sp,
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  CustomButton1({
    required this.color,
    required this.onPressed,
    this.textcolor,
    this.textsize,
    this.width,
    this.height,
    this.widget,
    Key? key,
  }) : super(key: key);

  final Color color;
  final VoidCallback onPressed;
  final Color? textcolor;
  final double? textsize;
  final double? width;
  final double? height;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 250.w,
      height: height,
      child: MaterialButton(
        height: 40.h,
        minWidth: double.infinity,
        onPressed: onPressed,
        color: color,
        child: widget,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      ),
    );
  }
}
