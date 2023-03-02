// ignore_for_file: must_be_immutable

import 'package:Ninja/Core/Helper/Color.dart';
import 'package:Ninja/Core/Helper/Common_Var.dart';
import 'package:Ninja/Feature/Profile/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Core/Common_Widget/Custom_Text.dart';
import '../../../Core/Common_Widget/googletext.dart';
import '../../Core/Firebase/auth.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  AppColor appColor = AppColor();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Authcontroler>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor.mainColor,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 10.w),
          child: CircleAvatar(
              radius: 20.r,
              backgroundColor: appColor.buttonColor,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
        ),
        title: CustomText(name: "Profile", size: 17.sp, color: appColor.white),
        centerTitle: true,
        actions: [
          Image.asset(
            "images/Edit.png",
            color: appColor.white,
            scale: 3,
          ),
          SizedBox(
            width: 5.w,
          )
        ],
      ),
      backgroundColor: appColor.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10),
        child: Column(children: [
          SizedBox(
            height: 25.w,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 150.h,
              child: Stack(children: [
                CircleAvatar(
                    radius: 70.r, backgroundImage: NetworkImage(data.photourl)),
                Positioned(
                  top: 110.h,
                  left: 50.w,
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: appColor.grey,
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                )
              ]),
            ),
          ),
          fixHeight,
          GoogleText(
            text: data.name,
            color: appColor.white,
          ),
          fixHeight,
          Field(
            data: data.name,
            type: "Full Name",
          ),
          fixHeight,
          Field(
            data: data.email,
            type: "Email",
          ),
          fixHeight,
          Field(
            data: "******",
            type: "Password",
          )
        ]),
      ),
    );
  }
}
