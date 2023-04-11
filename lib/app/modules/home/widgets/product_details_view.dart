// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_app/app/modules/home/controllers/home_controller.dart';
import 'package:task_app/utils/constants.dart';

import '../../../../config/theme/my_fonts.dart';

class ProductDetailsView extends StatelessWidget {
  int? index;
  ProductDetailsView({Key? key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GetBuilder<HomeController>(
      builder: (homeController) => Container(
        height: 440.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.h, left: 16.h, top: 16.h),
              child: Row(
                children: [
                  SizedBox(
                      height: 98.h,
                      width: 98.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        child: Image.file(
                          File(homeController.productList[index!].image
                              .toString()),
                          fit: BoxFit.cover,
                          height: 40.h,
                          width: 40.w,
                          errorBuilder: (context, url, error) => Image.asset(
                            AppImages.no_image,
                            fit: BoxFit.contain,
                            height: 130.h,
                            width: 200.w,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 100.h,
                    width: 245.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: SizedBox(
                                width: 200.w,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        homeController
                                            .productList[index!].name!,
                                        style: TextStyle(
                                          fontSize: MyFonts.body1TextSize,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Iconsax.close_circle,
                                size: 20,
                                color: theme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: SizedBox(
                            height: 28.h,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    homeController
                                        .productList[index!].description
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: MyFonts.chipTextSize,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Row(
                            children: [
                              Text(
                                  homeController
                                      .productList[index!].productPrice!.price
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: MyFonts.body1TextSize,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 4, top: 10, bottom: 4),
                        child: Text("Category".toString(),
                            style: TextStyle(
                                fontSize: MyFonts.body2TextSize,
                                fontWeight: FontWeight.w900,
                                color: Colors.black)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: theme.primaryColor.withOpacity(0.1),
                        ),
                        height: 40,
                        width: Get.width / 1.6,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: 40.w,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.r)),
                                child: CachedNetworkImage(
                                  imageUrl: homeController.productList[index!]
                                      .subCategory!.category!.image!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    child: Container(
                                        height: 130,
                                        width: 200,
                                        color: Colors.grey),
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[400]!,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    AppImages.no_image,
                                    fit: BoxFit.contain,
                                    height: 130.h,
                                    width: 200.w,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    homeController.productList[index!]
                                        .subCategory!.category!.name!,
                                    style: TextStyle(
                                        fontSize: MyFonts.body2TextSize,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black54)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 4, top: 10, bottom: 4),
                        child: Text("Brand".toString(),
                            style: TextStyle(
                                fontSize: MyFonts.body2TextSize,
                                fontWeight: FontWeight.w900,
                                color: Colors.black)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: theme.primaryColor.withOpacity(0.1),
                        ),
                        height: 40,
                        width: Get.width / 2.5,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: 40.w,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.r)),
                                child: CachedNetworkImage(
                                  imageUrl: homeController
                                      .productList[index!].brand!.image!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    child: Container(
                                        height: 130,
                                        width: 200,
                                        color: Colors.grey),
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[400]!,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    AppImages.no_image,
                                    fit: BoxFit.contain,
                                    height: 130.h,
                                    width: 200.w,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    homeController
                                        .productList[index!].brand!.name
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: MyFonts.body2TextSize,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black54)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(340.w, 48.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26.r),
                  ),
                ),
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                    fontSize: MyFonts.headline5TextSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  homeController
                      .deleteProduct(homeController.productList[index!].id);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 0,
                  minimumSize: Size(340.w, 48.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26.r),
                  ),
                ),
                child: Text(
                  "Delete Product",
                  style: TextStyle(
                    fontSize: MyFonts.headline5TextSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
