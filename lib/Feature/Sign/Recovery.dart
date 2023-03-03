import 'package:Ninja/Core/Firebase/auth.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Core/Common_Widget/Custom_Text.dart';
import '../../../Core/Common_Widget/custom-button.dart';
import '../../../Core/Common_Widget/custom_textfield.dart';
import '../../../Core/Helper/Color.dart';
import '../../../Core/Helper/Common_Var.dart';

class Recovery extends StatefulWidget {
  Recovery({super.key});

  @override
  State<Recovery> createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
  AppColor appColor = AppColor();

  late String restpassword;
  final Duration initialDelay = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    Provider.of<Authcontroler>(context, listen: false);
    return Scaffold(
      backgroundColor: appColor.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20.h),
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: appColor.buttonColor,
                  child: Center(
                      child: Icon(
                    Icons.arrow_back_ios_new,
                    color: appColor.white,
                  )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60.h,
          ),
          DelayedDisplay(
            delay: initialDelay,
            child: CustomText(
              name: "Recovery Password",
              size: 30.sp,
              color: Colors.black,
            ),
          ),
          fixHeight,
          DelayedDisplay(
            delay: initialDelay,
            child: CustomText(
              name: "Please Enter Your Email Address To",
              size: 16.sp,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          DelayedDisplay(
            delay: initialDelay,
            child: CustomText(
              name: "Recieve a Verification Code",
              size: 16.sp,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Height,
          Height,
          Height,
          DelayedDisplay(
            delay: initialDelay,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 25.w),
              child: CustomText(
                name: "Email Address",
                size: 18.sp,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          fixHeight,
          DelayedDisplay(
            delay: initialDelay,
            child: CustomTextfield(
              hintext: "Email",
              onchanged: (value) {
                restpassword = value;
              },
            ),
          ),
          Height,
          Height,
          SizedBox(
              height: 45.h,
              width: 300.w,
              child: Consumer<Authcontroler>(
                builder: (context, value, child) {
                  return DelayedDisplay(
                    delay: initialDelay,
                    child: CustomButton(
                      buttonname: 'Continue',
                      color: appColor.buttonColor,
                      textcolor: Colors.white,
                      onPressed: () {
                        value.passwordRest(remail: restpassword);
                      },
                    ),
                  );
                },
              )),
        ]),
      ),
    );
  }
}
