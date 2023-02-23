import 'package:Ninja/Core/BackEnd/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Core/Api/api_Integration.dart';
import '../../../Core/Api/model.dart';
import '../../../Core/Common_Widget/Custom_Text.dart';
import '../../../Core/Helper/Color.dart';
import '../../../Core/Helper/Common_Var.dart';
import '../../../Core/Routes/routesName.dart';

class AppleScr extends StatefulWidget {
  const AppleScr({super.key});

  @override
  State<AppleScr> createState() => _AppleScrState();
}

class _AppleScrState extends State<AppleScr> {
  LocalJson localJson = LocalJson();
  AppColor appColor = AppColor();
  @override
  Widget build(BuildContext context) {
    Provider.of<FavoriteProvider>(context, listen: false);
    print('Main page build');
    return Scaffold(
      backgroundColor: appColor.mainColor,
      body: Column(children: [
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
          height: 210.h,
          child: FutureBuilder<AppleModel>(
            future: localJson.iphone(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.apple!.length,
                  itemBuilder: (context, index) {
                    var name = snapshot.data!.apple![index].name.toString();
                    var price = snapshot.data!.apple![index].price.toString();
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.MobDetail,
                            arguments: {
                              'resolution':
                                  '${snapshot.data!.apple![index].resolution.toString()}',
                              'id': '${snapshot.data!.apple![index].id}',
                              'price': '${snapshot.data!.apple![index].price}',
                              'Image':
                                  '${snapshot.data!.apple![index].image.toString()}',
                              'ram':
                                  '${snapshot.data!.apple![index].ram.toString()}',
                              'name':
                                  '${snapshot.data!.apple![index].name.toString()}',
                              'bat':
                                  '${snapshot.data!.apple![index].battery.toString()}',
                              'cam':
                                  '${snapshot.data!.apple![index].cammera.toString()}',
                              'sce':
                                  '${snapshot.data!.apple![index].sensors.toString()}}',
                              'os':
                                  '${snapshot.data!.apple![index].oS.toString()}',
                              'cal':
                                  '${snapshot.data!.apple![index].released.toString()}',
                              'stor':
                                  '${snapshot.data!.apple![index].memory.toString()}',
                              'pro':
                                  '${snapshot.data!.apple![index].chipset.toString()}',
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
                                SizedBox(
                                  height: 20.h,
                                ),
                                Hero(
                                  tag: Key(snapshot.data!.apple![index].image
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
                                      snapshot.data!.apple![index].image
                                          .toString(),
                                      scale: 5),
                                ),
                                fixHeight,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomText(
                                    name: name,
                                    size: 17.sp,
                                    color: appColor.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: CustomText(
                                        name: price,
                                        size: 17.sp,
                                        color: appColor.black,
                                      ),
                                    ),
                                    Consumer<FavoriteProvider>(
                                      builder: (context, value, child) {
                                        return InkWell(
                                            onTap: () {
                                              var link = snapshot
                                                  .data!.apple![index].image
                                                  .toString();
                                              var name = snapshot
                                                  .data!.apple![index].name
                                                  .toString();
                                              var price = snapshot
                                                  .data!.apple![index].price
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
                                              color: value.img.contains(snapshot
                                                      .data!.apple![index].image
                                                      .toString())
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                name: "popular Phone", size: 18.sp, color: appColor.white),
            CustomText(
                name: "See All", size: 18.sp, color: appColor.buttonColor)
          ],
        ),
        fixHeight,
        FutureBuilder<AppleModel>(
            future: localJson.iphone(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.MobDetail,
                          arguments: {
                            'resolution':
                                '${snapshot.data!.apple![17].resolution.toString()}',
                            'Image':
                                '${snapshot.data!.apple![17].image.toString()}',
                            'id': '${snapshot.data!.apple![17].id.toString()}',
                            'price':
                                '${snapshot.data!.apple![17].price.toString()}',
                            'ram':
                                '${snapshot.data!.apple![17].ram.toString()}',
                            'name':
                                '${snapshot.data!.apple![17].name.toString()}',
                            'bat':
                                '${snapshot.data!.apple![17].battery.toString()}',
                            'cam':
                                '${snapshot.data!.apple![17].cammera.toString()}',
                            'sce':
                                '${snapshot.data!.apple![17].sensors.toString()}',
                            'os': '${snapshot.data!.apple![17].oS.toString()}',
                            'cal':
                                '${snapshot.data!.apple![17].released.toString()}',
                            'stor':
                                '${snapshot.data!.apple![17].memory.toString()}',
                            'pro':
                                '${snapshot.data!.apple![17].chipset.toString()}',
                          });
                    },
                    child: Container(
                        height: 140.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: appColor.white,
                            borderRadius: BorderRadius.circular(25.r)),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, top: 17.h, right: 13.w),
                            child: Column(children: [
                              Row(children: [
                                Container(
                                  width: 150.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          name: snapshot.data!.apple![17].name
                                              .toString(),
                                          size: 17.sp,
                                          color: appColor.black),
                                      fixHeight,
                                      CustomDetail(
                                        processor: snapshot
                                            .data!.apple![17].price
                                            .toString(),
                                        image: "images/price.png",
                                      ),
                                      CustomDetail(
                                        processor: snapshot
                                            .data!.apple![17].released
                                            .toString(),
                                        image: "images/calender.png",
                                      ),
                                    ],
                                  ),
                                ),
                                width,
                                Width,
                                Container(
                                  width: 120.w,
                                  child: Hero(
                                    tag: Key(snapshot.data!.apple![17].image
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
                                        "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-14-pro-max-1.jpg",
                                        scale: 4),
                                  ),
                                ),
                              ])
                            ]))));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
      ]),
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
  final AppColor appColor = AppColor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Row(
        children: [
          Image.asset(
            image,
            scale: 3,
          ),
          width,
          CustomText(name: processor, size: 16, color: appColor.black),
        ],
      ),
    );
  }
}
