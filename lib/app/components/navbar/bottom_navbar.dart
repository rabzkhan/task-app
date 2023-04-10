import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/app/modules/Page2/views/page2_view.dart';
import 'package:task_app/app/modules/Page3/views/page3_view.dart';
import 'package:task_app/app/modules/home/views/home_view.dart';
import 'package:task_app/config/theme/my_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({Key? key}) : super(key: key);

  List navigation = [
    const HomeView(),
    const Page2View(),
    const Page3View(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    void _onTap(int index) {
      _selectedIndex = index;

      (context as Element).markNeedsBuild();
    }

    return Scaffold(
      body: navigation[_selectedIndex],
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: theme.colorScheme.secondary.withOpacity(1),
                spreadRadius: 0,
                blurRadius: 20),
          ],
        ),
        //  margin: const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    _onTap(0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 0
                              ? theme.primaryColor
                              : Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            _selectedIndex == 0
                                ? IconlyBold.home
                                : IconlyLight.home,
                            color: _selectedIndex == 0
                                ? Colors.white
                                : theme.primaryColor.withOpacity(.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        _onTap(1);
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 1
                              ? theme.primaryColor
                              : Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Iconsax.additem4,
                            color: _selectedIndex == 1
                                ? Colors.white
                                : theme.primaryColor.withOpacity(.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        _onTap(2);
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 2
                              ? theme.primaryColor
                              : Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Iconsax.user,
                            size: 20,
                            color: _selectedIndex == 2
                                ? Colors.white
                                : theme.primaryColor.withOpacity(.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
