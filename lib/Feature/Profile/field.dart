// ignore_for_file: must_be_immutable

import 'package:Ninja/Core/Helper/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Common_Widget/googletext.dart';
import '../../../Core/Helper/Common_Var.dart';

class Field extends StatelessWidget {
  Field({required this.data, required this.type, super.key});
  AppColor appColor = AppColor();
  final String type;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: GoogleText(
            text: type,
            color: appColor.white,
          ),
        ),
        fixHeight,
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 320.w,
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: appColor.white),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GoogleText(text: data),
                )),
          ),
        )
      ],
    );
  }
}
