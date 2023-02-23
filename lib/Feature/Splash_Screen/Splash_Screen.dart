// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:Ninja/Core/Routes/routesName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/Firebase/auth.dart';
import '../../../Core/Helper/Color.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

String? User1;
String? User2;

class _SplashScreenState extends State<SplashScreen> {
  void didChangeDependencies() async {
    SharedPreferences sharepref = await SharedPreferences.getInstance();
    sharepref.containsKey("userid")
        ? Timer(Duration(seconds: 5), () {
            Navigator.pushNamed(context, RoutesName.BottomNav);
          })
        : Timer(Duration(seconds: 5), () {
            Navigator.pushNamed(context, RoutesName.loadd);
          });
    User1 = await sharepref.getString('userid').toString();
    User2 = await ldb.getuserData();
    super.didChangeDependencies();
  }

  AppColor appcolor = AppColor();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child: Image.asset("images/logob.png")),
            Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 40.h),
                child: Lottie.asset("images/load2.json", height: 80.h))
          ],
        ),
      ),
    );
  }
}
