import 'package:Ninja/Core/BackEnd/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Core/Common_Widget/Custom_Text.dart';
import '../../../Core/Helper/Color.dart';
import '../../../Core/Helper/Common_Var.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  AppColor appColor = AppColor();
  @override
  Widget build(BuildContext context) {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: appColor.mainColor,
      appBar: AppBar(
        backgroundColor: appColor.mainColor,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 10.w),
          child: CircleAvatar(
              radius: 20.r,
              backgroundColor: appColor.buttonColor,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
        ),
        title:
            CustomText(name: "Favourite", size: 17.sp, color: appColor.white),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.w),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: appColor.buttonColor,
              child: Center(
                  child: Icon(
                Icons.favorite_border,
                color: appColor.white,
              )),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: favoriteProvider.img.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.h,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10.w),
          itemBuilder: (context, index) {
            if (favoriteProvider.img.isEmpty) {
              return Text("no data");
            } else {
              return Container(
                decoration: BoxDecoration(
                    color: appColor.white,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    children: [
                      fixHeight,
                      Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: appColor.mainColo,
                          child: InkWell(
                            onTap: () {
                              favoriteProvider.removeimage(
                                  favoriteProvider.img[index].toString());
                            },
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ),
                      fixHeight,
                      Image.network(
                        favoriteProvider.img[index].toString(),
                        scale: 6,
                      ),
                      fixHeight,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                            name: favoriteProvider.favname[index].toString(),
                            size: 17.sp,
                            color: appColor.black),
                      ),
                      fixHeight,
                      Height,
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: CustomText(
                            name: "\$" +
                                favoriteProvider.favprice[index].toString(),
                            size: 17.sp,
                            color: appColor.black),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
