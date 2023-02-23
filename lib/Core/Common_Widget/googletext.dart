import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Helper/Color.dart';

// ignore: must_be_immutable
class GoogleText extends StatelessWidget {
  GoogleText({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  AppColor appColor = AppColor();
  String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.abel(
            textStyle: TextStyle(
          color: color ?? appColor.black,
          fontSize: 19.sp,
        )));
  }
}
