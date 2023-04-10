import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:task_app/app/modules/home/widgets/item_grid.dart';

import '../../../../config/theme/my_fonts.dart';
import '../../../../utils/constants.dart';
import '../controllers/home_controller.dart';
import '../widgets/product_card_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('myBox');
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              AppImages.kAppIcon,
              fit: BoxFit.contain,
              height: 40.h,
              width: 40.w,
            ),
            const Text('HomeView'),
          ],
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (homeController) => Column(children: [
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            primary: false,
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                child: SizedBox(
                  height: 34.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Product List",
                            style: TextStyle(
                              fontSize: MyFonts.headline5TextSize,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                            height: 24.h,
                            width: 66.w,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    box.put('viewValue', 0);
                                    (context as Element).markNeedsBuild();
                                  },
                                  child: SizedBox(
                                    width: 24.w,
                                    height: 24.h,
                                    child: SvgPicture.asset(
                                      AppImages.iconListView,
                                      fit: BoxFit.cover,
                                      color: box.get('viewValue') != 0
                                          ? Colors.black
                                          : theme.primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 18.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    box.put('viewValue', 1);
                                    (context as Element).markNeedsBuild();
                                  },
                                  child: SizedBox(
                                    width: 24.w,
                                    height: 24.h,
                                    child: SvgPicture.asset(
                                      AppImages.iconGridView,
                                      fit: BoxFit.cover,
                                      color: box.get('viewValue') != 1
                                          ? Colors.black
                                          : theme.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 17.h),
                child: Column(
                  children: [
                    if (box.get('viewValue') == 0)
                      productListView(homeController),
                    if (box.get('viewValue') == 1)
                      productGridView(context, homeController)
                  ],
                ),
              )
            ]),
          ))
        ]),
      ),
    );
  }
}

Widget productListView(homeController) {
  return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: homeController.productList.length,
      itemBuilder: (BuildContext context, index) {
        return itemCardList(homeController.productList[index], index, context);
      });
}

Widget productGridView(context, HomeController homeController) {
  return Column(
    children: [
      StaggeredGridView.countBuilder(
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        itemCount: homeController.productList.length,
        crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
        itemBuilder: (BuildContext context, int index) {
          return itemCardGrid(
              homeController.productList[index], index, context);
        },
      )
    ],
  );
}
