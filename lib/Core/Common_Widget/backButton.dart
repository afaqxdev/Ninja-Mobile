import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Helper/Color.dart';

// ignore: must_be_immutable
class BackButton extends StatelessWidget {
  BackButton({
    Key? key,
  }) : super(key: key);

  AppColor appColor = AppColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h),
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        radius: 20.r,
        backgroundColor: appColor.black,
        child: Center(
            child: Icon(
          Icons.arrow_back_ios_new,
          color: appColor.black,
        )),
      ),
    );
  }
}
