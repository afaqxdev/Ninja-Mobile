import 'package:Ninja/Feature/Landing_Screen/Landing.dart';
import 'package:Ninja/Feature/Landing_Screen/appleScreen.dart';
import 'package:Ninja/Feature/Landing_Screen/miScreen.dart';
import 'package:Ninja/Feature/Landing_Screen/samsung.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Core/BackEnd/loadBack.dart';
import '../../../Core/Common_Widget/custom-button.dart';
import '../../../Core/Helper/Color.dart';
import '../../../Core/Routes/routesName.dart';

class loadd extends StatefulWidget {
  const loadd({super.key});

  @override
  State<loadd> createState() => _loaddState();
}

PageController pageController = PageController();

class _loaddState extends State<loadd> {
  List<Widget> page = [
    LandingScreen(),
    AppleScreen(),
    SamsungScreen(),
    MiScreen(),
  ];
  AppColor appcolor = AppColor();
  @override
  Widget build(BuildContext context) {
    Provider.of<LoadBackEnd>(context, listen: false);
    print("build again ");
    return Scaffold(
      backgroundColor: appcolor.mainColor,
      body: Column(
        children: [
          Expanded(
              flex: 9,
              child: Consumer<LoadBackEnd>(
                builder: (context, value, child) {
                  return PageView(
                      children: page,
                      scrollDirection: Axis.horizontal,
                      controller: pageController,
                      onPageChanged: (num) {
                        value.SelectIndex(num);
                      });
                },
              )),
          Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Consumer<LoadBackEnd>(builder: (context, value, child) {
                  return Row(
                    children: [
                      Expanded(
                          child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 32.h,
                            ),
                            child: Container(
                              height: 5.h,
                              width: value.Selectindex == index ? 30.w : 10.w,
                              decoration: BoxDecoration(
                                  color: value.Selectindex == index
                                      ? appcolor.black
                                      : appcolor.white,
                                  borderRadius: BorderRadius.circular(12.r)),
                            ),
                          );
                        },
                      )),
                      value.Selectindex == 3
                          ? SizedBox(
                              width: 125.w,
                              height: 40.h,
                              child: CustomButton(
                                buttonname: "Get Started",
                                textcolor: appcolor.buttonColor,
                                color: appcolor.white,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.SingIN);
                                },
                              ),
                            )
                          : SizedBox()
                    ],
                  );
                })),
          ),
        ],
      ),
    );
  }
}
