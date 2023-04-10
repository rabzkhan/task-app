import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
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
        height: 400.h,
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
              child: Row(children: [
                SizedBox(
                  height: 98.h,
                  width: 98.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    child: CachedNetworkImage(
                      imageUrl: homeController.productList[index!].image!,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            // colorFilter:
                            //     ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        child: Container(
                            height: 130, width: 200, color: Colors.grey),
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[400]!,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  height: 98.h,
                  width: 230.w,
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
                                      homeController.productList[index!].name!,
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
                            child: SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: SvgPicture.asset(
                                AppImages.iconGridView,
                                fit: BoxFit.cover,
                              ),
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
                                  homeController.productList[index!].description
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
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
