import 'package:Ninja/Core/Firebase/auth.dart';
import 'package:Ninja/Core/Routes/routesName.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Core/BackEnd/cart_provider.dart';
import '../../../Core/BackEnd/loadBack.dart';
import '../../../Core/Common_Widget/Custom_Text.dart';
import '../../../Core/Common_Widget/custom_textfield.dart';
import '../../../Core/Helper/Color.dart';
import '../../../Core/Helper/Common_Var.dart';
import '../AppleScreen/appleScr.dart';
import '../Draw/drawer.dart';
import '../Samsung Screen/samsungScr.dart';
import '../Xiaomi Screen.dart/xiaomiScr.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isOpened = false;

  List<Widget> page = [AppleScr(), SamsungScr(), XiaomiScr()];
  PageController pageController = PageController();
  List<String> names = ["Apple", "Samsung", "Xiaomi"];
  List<String> images = [
    "images/apple.png",
    "images/samsung.png",
    "images/xiaomi1.png",
  ];
  AppColor appColor = AppColor();
  String Name = 'Afaq';
  late String image;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoadBackEnd>(context, listen: false);
    final data = Provider.of<Authcontroler>(
      context,
    );

    print('Main page build');
    return Scaffold(
      drawer: CustomDrawer(
        Name: data.name,
        image: data.photourl,
      ),
      appBar: AppBar(
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(name: "FR Kohat", size: 18.sp, color: appColor.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/location.png",
                    scale: 3,
                  ),
                  Width,
                  CustomText(
                      name: "Darra Adam Khel",
                      size: 17.sp,
                      color: appColor.black),
                ],
              )
            ]),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.mycart);
              },
              child: badges.Badge(
                badgeContent:
                    Consumer<CartProvider>(builder: (context, value, child) {
                  return CustomText(
                      name: value.getCounter().toString(),
                      color: appColor.white,
                      size: 15.sp);
                }),
                badgeAnimation: badges.BadgeAnimation.scale(
                    animationDuration: Duration(milliseconds: 300)),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: appColor.buttonColor,
                  child: Center(
                      child: Icon(
                    Icons.shopping_bag,
                    color: appColor.white,
                  )),
                ),
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: appColor.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            CustomTextfield(
                hintext: "search",
                color: appColor.white,
                iconname: Icon(
                  Icons.search,
                  color: appColor.white,
                )),
            fixHeight,
            SizedBox(
                height: 40.h,
                child: Consumer<LoadBackEnd>(
                  builder: (context, value, child) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              value.SelectindexButton == index;

                              pageController.jumpToPage(index);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: value.SelectindexButton == index
                                      ? appColor.buttonColor
                                      : appColor.white,
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                                width: value.SelectindexButton == index
                                    ? 160.w
                                    : 60.w,
                                child: value.SelectindexButton == index
                                    ? Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: CircleAvatar(
                                              backgroundColor: appColor.white,
                                              maxRadius: 27.r,
                                              backgroundImage:
                                                  AssetImage(images[index]),
                                            ),
                                          ),
                                          Text(
                                            names[index],
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: appColor.white),
                                          )
                                        ],
                                      )
                                    : Image.asset(images[index]),
                              ),
                            ),
                          );
                        });
                  },
                )),
            Expanded(
              child: PageView(
                children: page,
                scrollDirection: Axis.horizontal,
                controller: pageController,
                onPageChanged: (num) {
                  provider.SelectIndexButton(num);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
