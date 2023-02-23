// ignore_for_file: must_be_immutable, unused_local_variable, unused_import

import 'package:Ninja/Core/BackEnd/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Core/Api/api_Integration.dart';
import '../../Core/Api/model.dart';
import '../../Core/BackEnd/cart_provider.dart';
import '../../Core/Common_Widget/Custom_Text.dart';
import '../../Core/Helper/Color.dart';
import '../../Core/Helper/Common_Var.dart';
import '../../Core/Routes/routesName.dart';

class SamsungScr extends StatefulWidget {
  const SamsungScr({super.key});

  @override
  State<SamsungScr> createState() => _SamsungScrState();
}

class _SamsungScrState extends State<SamsungScr> {
  LocalJson localjson = LocalJson();
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                  name: "popular Phone", size: 18.sp, color: appColor.white),
            ],
          ),
          fixHeight,
          SizedBox(
            height: 210.h,
            child: FutureBuilder<SamsungModel>(
              future: localjson.samsungphone(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.samsung!.length,
                    itemBuilder: (context, index) {
                      var name = snapshot.data!.samsung![index].name.toString();
                      var price =
                          snapshot.data!.samsung![index].price.toString();
                      var image =
                          snapshot.data!.samsung![index].image.toString();
                      var resolution =
                          snapshot.data!.samsung![index].resolution.toString();
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.MobDetail,
                              arguments: {
                                'resolution':
                                    '${snapshot.data!.samsung![index].resolution.toString()}',
                                'Image':
                                    '${snapshot.data!.samsung![index].image.toString()}',
                                'price':
                                    '${snapshot.data!.samsung![index].price}',
                                'id':
                                    '${snapshot.data!.samsung![index].id.toString()}',
                                'ram':
                                    '${snapshot.data!.samsung![index].ram.toString()}',
                                'name':
                                    '${snapshot.data!.samsung![index].name.toString()}',
                                'bat':
                                    '${snapshot.data!.samsung![index].battery.toString()}',
                                'cam':
                                    '${snapshot.data!.samsung![index].cammera.toString()}',
                                'sce':
                                    '${snapshot.data!.samsung![index].sensors.toString()}}',
                                'os':
                                    '${snapshot.data!.samsung![index].oS.toString()}',
                                'cal':
                                    '${snapshot.data!.samsung![index].released.toString()}',
                                'stor':
                                    '${snapshot.data!.samsung![index].memory.toString()}',
                                'pro':
                                    '${snapshot.data!.samsung![index].chipset.toString()}',
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
                                      tag: Key(snapshot
                                          .data!.samsung![index].image
                                          .toString()),
                                      flightShuttleBuilder: (flightContext,
                                          animation,
                                          flightDirection,
                                          fromHeroContext,
                                          toHeroContext) {
                                        switch (flightDirection) {
                                          case HeroFlightDirection.push:
                                            return ScaleTransition(
                                                scale: animation.drive(Tween<
                                                            double>(
                                                        begin: 0.0, end: 1.0)
                                                    .chain(CurveTween(
                                                        curve: Curves
                                                            .fastOutSlowIn))),
                                                child: toHeroContext.widget);

                                          case HeroFlightDirection.pop:
                                            return fromHeroContext.widget;
                                        }
                                      },
                                      child:
                                          Image.network("${image}", scale: 5)),
                                  fixHeight,
                                  CustomText(
                                    name: name,
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
                                                    .data!.samsung![index].image
                                                    .toString();
                                                var name = snapshot
                                                    .data!.samsung![index].name
                                                    .toString();
                                                var price = snapshot
                                                    .data!.samsung![index].price
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
                                                        snapshot
                                                            .data!
                                                            .samsung![index]
                                                            .image
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(name: "New Phone", size: 18.sp, color: appColor.white),
            ],
          ),
          fixHeight,
          FutureBuilder<SamsungModel>(
            future: localjson.samsungphone(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.MobDetail,
                          arguments: {
                            'resolution':
                                '${snapshot.data!.samsung![15].resolution.toString()}',
                            'Image':
                                '${snapshot.data!.samsung![15].image.toString()}',
                            'ram':
                                '${snapshot.data!.samsung![15].ram.toString()}',
                            'price': '${snapshot.data!.samsung![15].price}',
                            'id':
                                '${snapshot.data!.samsung![15].id.toString()}',
                            'name':
                                '${snapshot.data!.samsung![15].name.toString()}',
                            'bat':
                                '${snapshot.data!.samsung![15].battery.toString()}',
                            'cam':
                                '${snapshot.data!.samsung![15].cammera.toString()}',
                            'sce':
                                '${snapshot.data!.samsung![15].sensors.toString()}',
                            'os':
                                '${snapshot.data!.samsung![15].oS.toString()}',
                            'cal':
                                '${snapshot.data!.samsung![15].released.toString()}',
                            'stor':
                                '${snapshot.data!.samsung![15].memory.toString()}',
                            'pro':
                                '${snapshot.data!.samsung![15].chipset.toString()}',
                          });
                    },
                    child: Container(
                      height: 140.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: appColor.white,
                          borderRadius: BorderRadius.circular(25.r)),
                      child: Row(
                        children: [
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
                                          name: snapshot.data!.samsung![15].name
                                              .toString(),
                                          size: 17.sp,
                                          color: appColor.black),
                                      fixHeight,
                                      CustomDetail(
                                        processor: snapshot
                                            .data!.samsung![15].price
                                            .toString(),
                                        image: "images/price.png",
                                      ),
                                      CustomDetail(
                                        processor: snapshot
                                            .data!.samsung![15].released
                                            .toString(),
                                        image: "images/calender.png",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Hero(
                                tag: Key(snapshot.data!.samsung![15].image
                                    .toString()),
                                flightShuttleBuilder: (flightContext,
                                    animation,
                                    flightDirection,
                                    fromHeroContext,
                                    toHeroContext) {
                                  switch (flightDirection) {
                                    case HeroFlightDirection.push:
                                      return ScaleTransition(
                                          scale: animation.drive(Tween<double>(
                                                  begin: 0.0, end: 1.0)
                                              .chain(CurveTween(
                                                  curve:
                                                      Curves.fastOutSlowIn))),
                                          child: toHeroContext.widget);

                                    case HeroFlightDirection.pop:
                                      return fromHeroContext.widget;
                                  }
                                },
                                child: Image.network(
                                    "${snapshot.data!.samsung![15].image.toString()}",
                                    scale: 4),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
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
          CustomText(name: processor, size: 16.sp, color: appColor.black),
        ],
      ),
    );
  }
}
