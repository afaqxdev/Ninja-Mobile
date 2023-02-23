import 'package:Ninja/Core/Firebase/auth.dart';
import 'package:Ninja/Feature/Sign/Sign_In.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../../Core/Common_Widget/Custom_Text.dart';
import '../../../Core/Helper/Color.dart';
import '../../../Core/Helper/Common_Var.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Future<void> _fsignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  CustomDrawer({required this.Name, required this.image, super.key});

  AppColor appcolor = AppColor();
  final String Name;
  final String image;
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Drawer(
        backgroundColor: appcolor.buttonColor,
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, top: 30.h),
          child: ListView(children: [
            SizedBox(
              height: 190.h,
              child: DrawerHeader(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundImage: AssetImage(
                          image,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                        ),
                      ),
                    ),
                    fixHeight,
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                        name: "Hey,",
                        size: 16.sp,
                        color: appcolor.white,
                      ),
                    ),
                    fixHeight,
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                          name: Name, size: 23.sp, color: appcolor.white),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              iconColor: appcolor.white,
              tileColor: appcolor.black.withOpacity(0.5),
              leading: Image.asset(
                "images/user.png",
                scale: 4,
                color: appcolor.white,
              ),
              title: CustomText(
                name: "Profile",
                size: 16.sp,
                color: appcolor.white,
              ),
            ),
            fixHeight,
            ListTile(
              iconColor: appcolor.white,
              tileColor: appcolor.black.withOpacity(0.5),
              leading: Image.asset(
                "images/home.png",
                scale: 4,
                color: appcolor.white,
              ),
              title: CustomText(
                name: "Home Page",
                size: 16.sp,
                color: appcolor.white,
              ),
            ),
            fixHeight,
            ListTile(
              iconColor: appcolor.white,
              tileColor: appcolor.black.withOpacity(0.5),
              leading: Image.asset(
                "images/Frame.png",
                scale: 4,
                color: appcolor.white,
              ),
              title: CustomText(
                name: "My Cart",
                size: 16.sp,
                color: appcolor.white,
              ),
            ),
            fixHeight,
            ListTile(
              iconColor: appcolor.white,
              tileColor: appcolor.black.withOpacity(0.5),
              leading: Image.asset(
                "images/Heart-Icon.png",
                scale: 4,
                color: appcolor.white,
              ),
              title: CustomText(
                name: "Favorite",
                size: 16.sp,
                color: appcolor.white,
              ),
            ),
            fixHeight,
            ListTile(
              iconColor: appcolor.white,
              tileColor: appcolor.black.withOpacity(0.5),
              leading: Image.asset(
                "images/Notifications.png",
                scale: 4,
                color: appcolor.white,
              ),
              title: CustomText(
                name: "Notification",
                size: 16.sp,
                color: appcolor.white,
              ),
            ),
            fixHeight,
            ListTile(
              iconColor: appcolor.white,
              tileColor: appcolor.black.withOpacity(0.5),
              leading: Image.asset(
                "images/Fats Delivery.png",
                scale: 4,
                color: appcolor.white,
              ),
              title: CustomText(
                name: "Order",
                size: 16.sp,
                color: appcolor.white,
              ),
            ),
            Height,
            Consumer<Authcontroler>(
              builder: (context, value, child) {
                return ListTile(
                  onTap: () {
                    if (value.Googlecheck != true) {
                      _signOut().then((value) {
                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new SignIn()));
                      });
                    } else {
                      _fsignOut().then((value) => Navigator.pushReplacement(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new SignIn())));
                    }
                    print(value.Googlecheck);
                  },
                  iconColor: appcolor.white,
                  tileColor: appcolor.white.withOpacity(0.5),
                  leading: Icon(Icons.logout_outlined),
                  title: CustomText(
                    name: "Logout",
                    size: 16.sp,
                    color: appcolor.white,
                  ),
                );
              },
            )
          ]),
        ),
      ),
      onWillPop: () async {
        return true;
      },
    );
  }
}
