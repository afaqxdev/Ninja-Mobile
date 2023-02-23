// ignore_for_file: must_be_immutable

import 'package:Ninja/Core/Common_Widget/Custom_Text.dart';
import 'package:Ninja/Core/Helper/Color.dart';
import 'package:Ninja/Core/Helper/Common_Var.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../Core/Common_Widget/custom-button.dart';
import '../../../Core/Common_Widget/googletext.dart';
import '../BottomNAv/bottomNav.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({required this.total, super.key});
  AppColor appColor = AppColor();

  dynamic total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColor.mainColor,
        appBar: AppBar(
          elevation: 0,
          title: Text("Check Out"),
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
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
              child: Container(
                height: 370.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: appColor.white,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h),
                  child: Column(children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: GoogleText(text: "Contact Information")),
                    fixHeight,
                    listTile(
                        imagepath: "images/Frame.png",
                        type: "Email",
                        category: "AfaqZahir007@gmail.com"),
                    listTile(
                        imagepath: "images/Frame-1.png",
                        type: "phone",
                        category: "+92 331 9791631"),
                    fixHeight,
                    Align(
                      alignment: Alignment.topLeft,
                      child: GoogleText(text: "Address"),
                    ),
                    fixHeight,
                    listTile(
                      category: "Address",
                      imagepath: "images/location.png",
                      type: "Adress",
                    ),
                    fixHeight,
                    Align(
                      alignment: Alignment.topLeft,
                      child: GoogleText(text: "Payment Method"),
                    ),
                    fixHeight,
                    listTile(
                        imagepath: "images/card.png",
                        category: "Master Card",
                        type: "**** **** 4564 2374")
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
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
                  ReuseableRow(
                    name: " Subtotal",
                    value: "\$" + total["subtotal"].toString(),
                  ),
                  ReuseableRow(name: "Tax", value: "\$" + total["tax"]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: appColor.grey,
                    endIndent: 20,
                    indent: 20,
                  ),
                  ReuseableRow(
                    name: " Total Price",
                    value: "\$ " + total["totalPrice"].toString(),
                  ),
                  fixHeight,
                  CustomButton(
                      width: 300.w,
                      buttonname: "Payment",
                      textcolor: appColor.white,
                      color: appColor.buttonColor,
                      onPressed: () {
                        Get.defaultDialog(
                            backgroundColor: appColor.white,
                            content: Center(
                              child: Container(
                                height: 150.h,
                                width: 150.w,
                                // color: appColor.grey,
                                margin: EdgeInsets.only(
                                  left: 35.w,
                                ),
                                child: Lottie.asset(
                                  "images/celeb.json",
                                ),
                              ),
                            ),
                            title: "",
                            actions: [
                              CustomText(
                                  name: "Your Payment is SuccessFull",
                                  size: 18.sp,
                                  color: appColor.black),
                              SizedBox(
                                height: 50.h,
                              ),
                              SizedBox(
                                width: 180.w,
                                child: CustomButton(
                                  buttonname: "Back to Shopping",
                                  textcolor: appColor.white,
                                  color: appColor.buttonColor,
                                  onPressed: () {
                                    Get.offAll(BottomNav());
                                  },
                                ),
                              ),
                            ]);
                      })
                ],
              ),
            )
          ],
        ));
  }
}

class listTile extends StatelessWidget {
  listTile({
    Key? key,
    required this.imagepath,
    required this.category,
    required this.type,
  }) : super(key: key);

  AppColor appColor = AppColor();
  String imagepath;
  String category;
  String type;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40.h,
        width: 50.w,
        decoration: BoxDecoration(
            color: appColor.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12.r)),
        child: Image.asset(
          imagepath,
          scale: 2.3,
        ),
      ),
      title: Text(category,
          style: GoogleFonts.abel(
              textStyle: TextStyle(
            color: appColor.black,
            fontSize: 16.sp,
          ))),
      subtitle: Text(type),
      trailing: Image.asset(
        "images/Edit.png",
        scale: 3,
      ),
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
