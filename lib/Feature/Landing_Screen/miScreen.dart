import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/Common_Widget/Custom_Text.dart';
import '../../../Core/Helper/Color.dart';
import '../../../Core/Helper/Common_Var.dart';

// ignore: must_be_immutable
class MiScreen extends StatelessWidget {
  MiScreen({super.key});
  AppColor appcolor = AppColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 60.h, left: 20.w),
              child: Image.asset(
                "images/xiaomi.png",
                fit: BoxFit.fill,
                height: 130.h,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  name: "Start Journey With\nNinja MOB",
                  size: 40.sp,
                  color: Colors.black,
                ),
                fixHeight,
                CustomText(
                    name:
                        "Smart Phone like Xiaomi\nbrand Collection with latest Phone",
                    size: 20.sp,
                    color: appcolor.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
