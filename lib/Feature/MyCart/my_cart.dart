// ignore_for_file: must_be_immutable

import 'package:Ninja/Core/BackEnd/cart_provider.dart';
import 'package:Ninja/Core/Common_Widget/Custom_Text.dart';
import 'package:Ninja/Core/Common_Widget/custom-button.dart';
import 'package:Ninja/Core/Helper/Color.dart';
import 'package:Ninja/Core/Helper/Common_Var.dart';
import 'package:Ninja/Core/HiveDB/boxes.dart';
import 'package:Ninja/Core/HiveDB/model.dart';
import 'package:Ninja/Core/Routes/routesName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  void delete(ModelHive modelHive) async {
    modelHive.delete();
  }

  AppColor appColor = AppColor();
  bool open = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);

    return IgnorePointer(
      ignoring: open,
      child: Scaffold(
          backgroundColor: appColor.mainColor,
          appBar: AppBar(
            elevation: 0,
            title: Text("My Cart"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
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
                    ))),
          ),
          body: Column(
            children: [
              Expanded(
                child: ValueListenableBuilder<Box<ModelHive>>(
                    valueListenable: Boxes.getData().listenable(),
                    builder: (context, boxes, _) {
                      var data = boxes.values.toList().cast<ModelHive>();

                      return ListView.builder(
                          itemCount: boxes.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Row(children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  padding: EdgeInsets.all(12.sp),
                                  decoration: BoxDecoration(
                                      color: appColor.white,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Image.network(
                                    data[index].images.toString(),
                                    scale: 6,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        name: data[index].name.toString(),
                                        size: 16.sp,
                                        color: appColor.black,
                                        fontweight: FontWeight.bold),
                                    fixHeight,
                                    CustomText(
                                        name:
                                            "\$ ${data[index].price.toString()}",
                                        size: 16.sp,
                                        color: appColor.black),
                                    fixHeight,
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: appColor.white,
                                          radius: 10.r,
                                          child: Center(child: Text('-')),
                                        ),
                                        Width,
                                        CustomText(
                                            name:
                                                data[index].quantity.toString(),
                                            size: 16.sp,
                                            color: appColor.black),
                                        Width,
                                        CircleAvatar(
                                          backgroundColor: appColor.buttonColor,
                                          radius: 10.r,
                                          child: Center(
                                              child: Text(
                                            '+',
                                            style: TextStyle(
                                                color: appColor.white),
                                          )),
                                        ),
                                        SizedBox(
                                          width: 100.w,
                                        ),
                                        Consumer<CartProvider>(
                                          builder: (context, value, child) {
                                            return InkWell(
                                              onTap: () {
                                                delete(data[index]);

                                                value.removeTotalPrice(
                                                    double.parse(
                                                            data[index].price)
                                                        .toDouble());
                                                value.removerCounter();
                                                value.removeTaxes();
                                                value.removeSubTotal(
                                                    double.parse(
                                                            data[index].price)
                                                        .toDouble());
                                              },
                                              child: Align(
                                                alignment: Alignment.topCenter,
                                                child: Icon(
                                                  Icons.delete_outline_outlined,
                                                  color: appColor.white,
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ]),
                            );
                          });
                    }),
              ),
              Visibility(
                  visible: provider.getSubTotal().toStringAsFixed(2) == "0.0"
                      ? false
                      : true,
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: appColor.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Consumer<CartProvider>(
                          builder: (context, value, child) {
                            return ReuseableRow(
                              name: " Subtotal",
                              value: value.getTotalPrice().toStringAsFixed(2),
                            );
                          },
                        ),
                        Consumer<CartProvider>(
                            builder: (context, value, child) {
                          return ReuseableRow(
                              name: "Tax",
                              value:
                                  "\$" + value.getTaxes().toStringAsFixed(2));
                        }),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          color: appColor.grey,
                          endIndent: 20,
                          indent: 20,
                        ),
                        Consumer<CartProvider>(
                            builder: (context, value, child) {
                          return ReuseableRow(
                            name: " Total Price",
                            value:
                                "\$ " + value.getSubTotal().toStringAsFixed(2),
                          );
                        }),
                        fixHeight,
                        CustomButton(
                            width: 300.w,
                            buttonname: "CheckOut",
                            textcolor: appColor.white,
                            color: appColor.buttonColor,
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RoutesName.PaymentScr,
                                  arguments: {
                                    "tax":
                                        "${provider.getTaxes().toStringAsFixed(2)}",
                                    "totalPrice":
                                        "${provider.getSubTotal().toStringAsFixed(2)}",
                                    "subtotal":
                                        "${provider.getTotalPrice().toStringAsFixed(2)}"
                                  });
                            })
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  ReuseableRow({required this.name, required this.value, super.key});
  String name;
  String value;
  @override
  Widget build(BuildContext context) {
    AppColor appColor = AppColor();
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 15.w, top: 20.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomText(name: name, size: 18.sp, color: appColor.grey),
        CustomText(name: value, size: 20.sp, color: appColor.black),
      ]),
    );
  }
}
