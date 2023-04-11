// ignore_for_file: sort_child_properties_last
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_app/app/modules/home/model/product_model.dart';
import 'package:task_app/app/modules/home/widgets/product_details_view.dart';
import '../../../../config/theme/my_fonts.dart';
import '../../../../utils/constants.dart';

Widget itemCardList(ProductModel item, index, context) {
  var theme = Theme.of(context);
  return InkWell(
    onTap: () {
      showBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
          child: ProductDetailsView(index: index),
        ),
      );
    },
    child: Padding(
      padding: EdgeInsets.only(bottom: 16.h, left: 12, right: 12),
      child: Container(
        height: 110.h,
        width: 328.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: theme.cardColor,
          boxShadow: [
            BoxShadow(
              color: theme.disabledColor.withOpacity(0.1),
              offset: const Offset(
                0.0,
                4.0,
              ),
              blurRadius: 5.r,
              spreadRadius: 1.r,
            ),
            BoxShadow(
              color: theme.disabledColor.withOpacity(0.1),
              offset: const Offset(
                1.0,
                0.0,
              ),
              blurRadius: 1.r,
              spreadRadius: 0.1.r,
            ), //BoxShadow
            //BoxShadow
          ],
        ),
        child: Row(children: [
          SizedBox(
            height: 110.h,
            width: 110.w,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              child: CachedNetworkImage(
                imageUrl: item.image.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      // colorFilter: ColorFilter.mode(
                      //     Colors.red, BlendMode.colorBurn),
                    ),
                  ),
                ),
                placeholder: (context, url) => Shimmer.fromColors(
                  child: Container(
                      height: 130.h, width: 200.w, color: Colors.grey),
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[400]!,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  AppImages.no_image,
                  fit: BoxFit.contain,
                  height: 130.h,
                  width: 200.w,
                ),
              ),
            ),
          ),
          //changehere
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(8.w, 8.h, 0.w, 4.h),
                  child: SizedBox(
                    width: 220.w,
                    child: SizedBox(
                      height: 40.h,
                      child: Text(
                        item.name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: MyFonts.body1TextSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: SizedBox(
                    height: 30.h,
                    child: Text(
                      item.description!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MyFonts.chipTextSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, top: 4),
                  child: SizedBox(
                    child: Text(
                      item.productPrice!.price.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MyFonts.body1TextSize,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    ),
  );
}
