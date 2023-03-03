import 'package:Ninja/Core/BackEnd/signIn_signOut.dart';
import 'package:Ninja/Core/Firebase/auth.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Core/Common_Widget/Custom_Text.dart';
import '../../../Core/Common_Widget/Image_Button.dart';
import '../../../Core/Common_Widget/custom-button.dart';
import '../../../Core/Common_Widget/custom_textfield.dart';
import '../../../Core/Helper/Color.dart';
import '../../../Core/Helper/Common_Var.dart';
import '../../../Core/Routes/routesName.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String Email, password;
  AppColor appColor = AppColor();
  final Duration initialDelay = Duration(seconds: 1);
  ValueNotifier<bool> toogle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    Provider.of<Authcontroler>(context, listen: false);
    final check = Provider.of<CheckSignInandOut>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColor.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(children: [
          SizedBox(
            height: 120.h,
          ),
          DelayedDisplay(
            delay: initialDelay,
            child: CustomText(
              name: "Hello Again!",
              size: 30.sp,
              color: appColor.black,
            ),
          ),
          fixHeight,
          DelayedDisplay(
            delay: initialDelay,
            child: CustomText(
              name: "Wellcome Back You've Been Missed",
              size: 16.sp,
              color: appColor.white,
            ),
          ),
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
                Email = value;
              },
            ),
          ),
          Height,
          Height,
          DelayedDisplay(
            delay: initialDelay,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 25.w),
              child: CustomText(
                name: "Password",
                size: 18.sp,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          fixHeight,
          ValueListenableBuilder(
            valueListenable: toogle,
            builder: (context, value, child) {
              return DelayedDisplay(
                delay: initialDelay,
                child: CustomTextfield(
                    hintext: "Password",
                    onchanged: (value) {
                      password = value;
                    },
                    showtext: toogle.value,
                    passicon: InkWell(
                      onTap: () {
                        toogle.value = !toogle.value;
                      },
                      child: Icon(
                          toogle.value
                              ? Icons.visibility_off_sharp
                              : Icons.visibility_sharp,
                          color: appColor.grey),
                    )),
              );
            },
          ),
          fixHeight,
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.Forgot);
            },
            child: DelayedDisplay(
              delay: initialDelay,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 25.w),
                child: CustomText(
                  name: "Recoery Password",
                  color: appColor.buttonColor,
                  size: 17.sp,
                ),
              ),
            ),
          ),
          Height,
          Height,
          SizedBox(
              height: 40.h,
              width: 270.w,
              child: Consumer<Authcontroler>(
                builder: (context, value, child) {
                  return DelayedDisplay(
                    delay: initialDelay,
                    child: CustomButton(
                        buttonname: "Sign In",
                        color: appColor.buttonColor,
                        textcolor: appColor.white,
                        textsize: 17.sp,
                        onPressed: () async {
                          await value.SignIn(email: Email, password: password);
                          check.checkedSign(true);
                        }),
                  );
                },
              )),
          Height,
          SizedBox(
              height: 45.h,
              width: 270.w,
              child: Consumer<Authcontroler>(
                builder: (context, value, child) {
                  return DelayedDisplay(
                    delay: initialDelay,
                    child: imageButton(
                      widget: Image.asset(
                        'images/google.png',
                        scale: 3,
                      ),
                      colors: appColor.white,
                      buttonname: "Sign In with Google",
                      color: appColor.buttonColor,
                      textsize: 17.sp,
                      onPressed: () {
                        value.signInWithGoogle();
                        check.checkedSign(true);
                      },
                    ),
                  );
                },
              )),
          DelayedDisplay(
            delay: initialDelay,
            child: Container(
              margin: EdgeInsets.only(top: 80.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomText(
                    name: "Don't Have a Account?",
                    size: 16.sp,
                    color: appColor.white),
                GestureDetector(
                  onTap: (() {
                    Navigator.pushNamed(context, RoutesName.SignUP);
                  }),
                  child: CustomText(
                      name: "\tSign Up free",
                      size: 16.sp,
                      fontweight: FontWeight.bold,
                      color: appColor.buttonColor),
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
