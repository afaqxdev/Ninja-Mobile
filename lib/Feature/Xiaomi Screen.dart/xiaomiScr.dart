// ignore_for_file: must_be_immutable

import 'package:Ninja/Core/BackEnd/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Core/Api/api_Integration.dart';
import '../../../Core/Common_Widget/Custom_Text.dart';
import '../../../Core/Helper/Color.dart';
import '../../../Core/Helper/Common_Var.dart';
import '../../../Core/Routes/routesName.dart';

class XiaomiScr extends StatefulWidget {
  const XiaomiScr({super.key});

  @override
  State<XiaomiScr> createState() => _XiaomiScrState();
}

class _XiaomiScrState extends State<XiaomiScr> {
  LocalJson localJson = LocalJson();
  Xiamilocal xiamilocal = Xiamilocal();
  AppColor appColor = AppColor();
  @override
  Widget build(BuildContext context) {
    Provider.of<FavoriteProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: appColor.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(children: [
          fixHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  name: "popular Phone", size: 18.sp, color: appColor.white),
              CustomText(
                  name: "See All", size: 18.sp, color: appColor.buttonColor)
            ],
          ),
          fixHeight,
          SizedBox(
            height: 200.h,
            child: FutureBuilder(
              future: xiamilocal.xaimiphone(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.MobDetail,
                              arguments: {
                                'resolution':
                                    '${snapshot.data['xiaomi'][index]['resolution'].toString()}',
                                'Image':
                                    '${snapshot.data['xiaomi'][index]['image'].toString()}',
                                'price':
                                    '${snapshot.data['xiaomi'][index]['price'].toString()}',
                                'id':
                                    '${snapshot.data['xiaomi'][index]['id'].toString()}',
                                'ram':
                                    '${snapshot.data['xiaomi'][index]['ram'].toString()}',
                                'name':
                                    '${snapshot.data['xiaomi'][index]['name'].toString()}',
                                'bat':
                                    '${snapshot.data['xiaomi'][index]['battery'].toString()}',
                                'cam':
                                    '${snapshot.data['xiaomi'][index]['cammera'].toString()}',
                                'sce':
                                    '${snapshot.data['xiaomi'][index]['sensor'].toString()}',
                                'os':
                                    '${snapshot.data['xiaomi'][index]['oS'].toString()}',
                                'cal':
                                    '${snapshot.data['xiaomi'][index]['released'].toString()}',
                                'stor':
                                    '${snapshot.data['xiaomi'][index]['memory'].toString()}',
                                'pro':
                                    '${snapshot.data['xiaomi'][index]['chipset'].toString()}',
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150.w,
                            decoration: BoxDecoration(
                                color: appColor.white,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Hero(
                                    tag: Key(snapshot.data['xiaomi'][index]
                                            ['image']
                                        .toString()),
                                    flightShuttleBuilder: (flightContext,
                                        animation,
                                        flightDirection,
                                        fromHeroContext,
                                        toHeroContext) {
                                      switch (flightDirection) {
                                        case HeroFlightDirection.push:
                                          return ScaleTransition(
                                              scale: animation.drive(
                                                  Tween<double>(
                                                          begin: 0.0, end: 1.0)
                                                      .chain(CurveTween(
                                                          curve: Curves
                                                              .fastOutSlowIn))),
                                              child: toHeroContext.widget);

                                        case HeroFlightDirection.pop:
                                          return fromHeroContext.widget;
                                      }
                                    },
                                    child: Image.network(
                                        snapshot.data["xiaomi"][index]['image']
                                            .toString(),
                                        scale: 5),
                                  ),
                                  fixHeight,
                                  CustomText(
                                    name: snapshot.data["xiaomi"][index]['name']
                                        .toString(),
                                    size: 17.sp,
                                    color: appColor.black,
                                  ),
                                  fixHeight,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: CustomText(
                                          name: snapshot.data["xiaomi"][index]
                                                  ['price']
                                              .toString(),
                                          size: 17.sp,
                                          color: appColor.black,
                                        ),
                                      ),
                                      Consumer<FavoriteProvider>(
                                        builder: (context, value, child) {
                                          return InkWell(
                                              onTap: () {
                                                var link = snapshot
                                                    .data["xiaomi"][index]
                                                        ['image']
                                                    .toString();
                                                var name = snapshot
                                                    .data["xiaomi"][index]
                                                        ['name']
                                                    .toString();
                                                var price = snapshot
                                                    .data["xiaomi"][index]
                                                        ['price']
                                                    .toString();
                                                if (value.img.contains(link)) {
                                                  value.removeimage(link);
                                                  value.removefavprice(price);
                                                  value.removefavname(name);
                                                } else {
                                                  value.addimage(link);
                                                  value.addfavprice(price);
                                                  value.addname(name);
                                                }
                                              },
                                              child: Icon(
                                                Icons.favorite_border_outlined,
                                                color: value.img.contains(
                                                  snapshot.data["xiaomi"][index]
                                                          ['image']
                                                      .toString(),
                                                )
                                                    ? Colors.red
                                                    : Colors.black,
                                              ));
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          fixHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                  name: "popular Phone", size: 18.sp, color: appColor.white),
            ],
          ),
          fixHeight,
          fixHeight,
          FutureBuilder(
              future: xiamilocal.xaimiphone(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.MobDetail,
                            arguments: {
                              'resolution':
                                  '${snapshot.data['xiaomi'][15]['resolution'].toString()}',
                              'Image':
                                  '${snapshot.data['xiaomi'][15]['image'].toString()}',
                              'price':
                                  '${snapshot.data['xiaomi'][15]['price'].toString()}',
                              'id':
                                  '${snapshot.data['xiaomi'][15]['id'].toString()}',
                              'ram':
                                  '${snapshot.data['xiaomi'][15]['ram'].toString()}',
                              'name':
                                  '${snapshot.data['xiaomi'][15]['name'].toString()}',
                              'bat':
                                  '${snapshot.data['xiaomi'][15]['battery'].toString()}',
                              'cam':
                                  '${snapshot.data['xiaomi'][15]['cammera'].toString()}',
                              'sce':
                                  '${snapshot.data['xiaomi'][15]['sensor'].toString()}',
                              'os':
                                  '${snapshot.data['xiaomi'][15]['oS'].toString()}',
                              'cal':
                                  '${snapshot.data['xiaomi'][15]['released'].toString()}',
                              'stor':
                                  '${snapshot.data['xiaomi'][15]['memory'].toString()}',
                              'pro':
                                  '${snapshot.data['xiaomi'][15]['chipset'].toString()}',
                            });
                      },
                      //
                      child: Container(
                          height: 140.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: appColor.white,
                              borderRadius: BorderRadius.circular(25.r)),
                          child: Row(children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 160.w,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w, top: 17.h, right: 13.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            name: snapshot.data['xiaomi'][15]
                                                    ['name']
                                                .toString(),
                                            size: 17.sp,
                                            color: appColor.black),
                                        fixHeight,
                                        CustomDetail(
                                          processor: snapshot.data['xiaomi'][15]
                                                  ['price']
                                              .toString(),
                                          image: "images/price.png",
                                        ),
                                        CustomDetail(
                                          processor: snapshot.data["xiaomi"][15]
                                                  ['released']
                                              .toString(),
                                          image: "images/calender.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Width,
                            width,
                            Row(
                              children: [
                                Hero(
                                  tag: Key(snapshot.data['xiaomi'][15]['image']
                                      .toString()),
                                  flightShuttleBuilder: (flightContext,
                                      animation,
                                      flightDirection,
                                      fromHeroContext,
                                      toHeroContext) {
                                    switch (flightDirection) {
                                      case HeroFlightDirection.push:
                                        return ScaleTransition(
                                            scale: animation.drive(
                                                Tween<double>(
                                                        begin: 0.0, end: 1.0)
                                                    .chain(CurveTween(
                                                        curve: Curves
                                                            .fastOutSlowIn))),
                                            child: toHeroContext.widget);

                                      case HeroFlightDirection.pop:
                                        return fromHeroContext.widget;
                                    }
                                  },
                                  child: Image.network(
                                      "${snapshot.data['xiaomi'][15]['image'].toString()}",
                                      scale: 4),
                                ),
                              ],
                            )
                          ])));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ]),
      ),
    );
  }
}

class CustomDetail extends StatelessWidget {
  CustomDetail({
    Key? key,
    required this.processor,
    required this.image,
  }) : super(key: key);

  final String processor;

  final String image;
  AppColor appColor = AppColor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Row(
        children: [
          Image.asset(
            image,
            scale: 5,
          ),
          width,
          Expanded(
            child: CustomText(
                name: processor,
                maxLines: 3,
                size: 15.sp,
                color: appColor.black),
          ),
        ],
      ),
    );
  }
}
