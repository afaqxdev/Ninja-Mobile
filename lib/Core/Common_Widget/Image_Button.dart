import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Helper/Common_Var.dart';

// ignore: must_be_immutable
class imageButton extends StatelessWidget {
  imageButton({
    required this.buttonname,
    required this.color,
    required this.onPressed,
    this.colors,
    this.textsize,
    this.widget,
    Key? key,
  }) : super(key: key);

  final Color color;
  final String buttonname;
  final VoidCallback onPressed;
  final Color? colors;
  final double? textsize;
  Widget? widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      child: MaterialButton(
        height: 40.h,
        minWidth: double.infinity,
        onPressed: onPressed,
        color: color,
        child: Row(
          children: [
            Width,
            Width,
            Container(
              child: widget,
            ),
            Width,
            Text(
              buttonname,
              style: TextStyle(
                color: colors ?? Colors.black,
                fontSize: textsize ?? 19.sp,
              ),
            ),
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      ),
    );
  }
}
