import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_app/app/modules/home/controllers/home_controller.dart';
import 'package:task_app/app/modules/home/widgets/product_details_view.dart';

import '../../../../config/theme/my_fonts.dart';
import '../../../../utils/constants.dart';

Widget itemCardGrid(item, index, context) {
  var theme = Theme.of(context);
  return InkWell(
    onTap: () {
      showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: ProductDetailsView(index: index),
        ),
      );
    },
    child: Container(
      height: 200.h,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              child: CachedNetworkImage(
                imageUrl: item[index].image!,
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
                  // ignore: sort_child_properties_last
                  child: Container(height: 90.h, color: Colors.grey),
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
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                    child: Text(item[index].name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: MyFonts.body1TextSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Text(
                      item[index].description!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MyFonts.chipTextSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      item[index].productPrice!.price.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MyFonts.body1TextSize,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
