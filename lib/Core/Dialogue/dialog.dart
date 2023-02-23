import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Common_Widget/Custom_Text.dart';
import '../Helper/Color.dart';
import '../Helper/Common_Var.dart';

AppColor appcolor = AppColor();

class CommonDialog {
  static showDialog({String title = "Loading..."}) {
    Get.dialog(
      Dialog(
        backgroundColor: appcolor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.green,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static hideLoading() {
    Get.back();
  }

  static showLoading() {}

  static showErrorDialog(
      {String title = "Oops Error",
      String description = "Something went wrong"}) {
    Get.dialog(Dialog(
      backgroundColor: appcolor.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              name: title,
              size: 19.sp,
              color: appcolor.black,
            ),
            fixHeight,
            CustomText(
              name: description,
              size: 16.sp,
              color: Colors.black,
            )
          ],
        ),
      ),
    ));
  }
}
