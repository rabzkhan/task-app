// ignore_for_file: sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_app/utils/constants.dart';
import '../../../../config/theme/my_fonts.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.h,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
                          child: CachedNetworkImage(
                            imageUrl:
                                controller.profileModel.imageUrl.toString(),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                  // colorFilter: ColorFilter.mode(
                                  //     Colors.red, BlendMode.colorBurn),
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Shimmer.fromColors(
                              child: Container(
                                  height: 86.h,
                                  width: 154.w,
                                  color: Colors.grey),
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[400]!,
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            AppImages.dotCircle,
                            color: theme.primaryColor,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  controller.profileModel.firstName.toString() +
                      " " +
                      controller.profileModel.lastName.toString(),
                  style: TextStyle(
                    fontSize: MyFonts.headline6TextSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  controller.profileModel.email.toString(),
                  style: TextStyle(
                    fontSize: MyFonts.captionTextSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  controller.profileModel.phone.toString(),
                  style: TextStyle(
                    fontSize: MyFonts.captionTextSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: theme.primaryColor),
                                child: const Center(
                                  child: Icon(
                                    Iconsax.logout,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.h,
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(
                                  fontSize: MyFonts.captionTextSize,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: theme.disabledColor.withOpacity(0.1)),
                            child: const Center(
                              child: Icon(
                                Iconsax.arrow_right_1,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
