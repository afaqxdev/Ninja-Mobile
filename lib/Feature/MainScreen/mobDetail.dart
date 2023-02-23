// ignore_for_file: must_be_immutable

import 'package:Ninja/Core/BackEnd/cart_provider.dart';
import 'package:Ninja/Core/HiveDB/boxes.dart';
import 'package:Ninja/Core/HiveDB/model.dart';
import 'package:Ninja/Core/Routes/routesName.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Core/Api/api_Integration.dart';
import '../../../Core/Common_Widget/Custom_Text.dart';
import '../../../Core/Helper/Color.dart';
import '../../../Core/Helper/Common_Var.dart';
import '../../../Core/Helper/snackbar.dart';

class MobDetail extends StatefulWidget {
  MobDetail({required this.data, super.key});

  dynamic data;

  @override
  State<MobDetail> createState() => _MobDetailState();
}

class _MobDetailState extends State<MobDetail> {
  AppColor appColor = AppColor();

  late int id = int.parse(widget.data["id"]);
  late double prices = double.parse(widget.data['price']);
  LocalJson localJson = LocalJson();
  CutomSnackbar cutomSnackbar = CutomSnackbar();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    print("detail screen build");
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.only(left: 10.w),
            child: CircleAvatar(
                radius: 20.r,
                backgroundColor: appColor.buttonColor,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Color.fromARGB(255, 248, 224, 224),
                  ),
                )),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, RoutesName.mycart),
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
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 200.h,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: Key(widget.data["Image"]),
                      child: Image.network(
                        widget.data["Image"],
                        scale: 4,
                      ),
                    ),
                    Image.asset(
                      "images/circle.png",
                      scale: 4,
                    )
                  ]),
            ),
            Container(
              height: 330.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: appColor.mainColo,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fixHeight,
                        CustomText(
                            name: widget.data['name'],
                            size: 20.sp,
                            color: appColor.black),
                        fixHeight,
                        CustomText(
                            name: '${widget.data['price']}',
                            size: 20.sp,
                            color: appColor.black),
                        fixHeight,
                        CustomDetail(
                          image: "images/pro1.png",
                          processor: widget.data["pro"],
                        ),
                        fixHeight,
                        CustomDetail(
                          image: "images/bat.png",
                          processor: widget.data["bat"],
                        ),
                        fixHeight,
                        CustomDetail(
                          image: "images/res.png",
                          processor: widget.data["resolution"],
                        ),
                        fixHeight,
                        CustomDetail(
                          image: "images/cam.png",
                          processor: widget.data["cam"],
                        ),
                        fixHeight,
                        CustomDetail(
                          image: "images/sce.png",
                          processor: widget.data["sce"],
                        ),
                        fixHeight,
                        CustomDetail(
                            image: "images/OS.png",
                            processor: widget.data["os"]),
                        fixHeight,
                        CustomDetail(
                          image: "images/calender.png",
                          processor: widget.data["cal"],
                        ),
                        fixHeight,
                        CustomDetail(
                          image: "images/storage.png",
                          processor: widget.data["stor"],
                        ),
                        fixHeight,
                        CustomDetail(
                            image: "images/pro.png",
                            processor: widget.data["ram"]),
                      ]),
                ),
              ),
            ),
          ]),
        ),
        bottomNavigationBar: Container(
            height: 60.h,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 236, 235, 235),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "images/price.png",
                          scale: 2,
                        ),
                        width,
                        CustomText(
                            name: "\$200",
                            size: 15.sp,
                            maxLines: 3,
                            color: appColor.black),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            final storedata = ModelHive(
                                id: widget.data["id"],
                                name: widget.data['name'].toString(),
                                price: widget.data['price'],
                                quantity: 1,
                                images: widget.data['Image'],
                                totalprice: widget.data['price']);
                            final boxes = Boxes.getData();

                            boxes.add(storedata).then((value) {
                              print('add product successfully');
                              cart.addCounter();
                              cart.addTaxes();
                              cart.subTotal(prices);
                              cart.addTotalPrice(prices);
                            }).onError((error, stackTrace) {
                              print(error.toString());
                            });
                          },
                          child: Container(
                            height: 40.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: appColor.buttonColor.withOpacity(0.2),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.r),
                                    bottomLeft: Radius.circular(25.r))),
                            child: Center(
                              child: CustomText(
                                name: "Add to Cart",
                                size: 17.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            double total = 1.96 + prices;
                            Navigator.pushNamed(context, RoutesName.PaymentScr,
                                arguments: {
                                  "tax": "1.96",
                                  'totalPrice': total,
                                  'subtotal': prices
                                });
                          },
                          child: Container(
                            height: 40.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: appColor.buttonColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25.r),
                                    bottomRight: Radius.circular(25.r))),
                            child: Center(
                              child: CustomText(
                                name: "Buy Now",
                                size: 17.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
            )));
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
    return Row(
      children: [
        Image.asset(
          image,
          scale: 3,
        ),
        width,
        width,
        Expanded(
          child: CustomText(
              name: processor, size: 15.sp, maxLines: 3, color: appColor.black),
        ),
      ],
    );
  }
}
