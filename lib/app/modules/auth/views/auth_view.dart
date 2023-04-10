import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:task_app/app/components/custom_snackbar.dart';
import 'package:task_app/app/modules/auth/controllers/auth_controller.dart';

import 'package:task_app/config/theme/my_fonts.dart';

import '../../../../utils/constants.dart';
import '../../../components/navbar/bottom_navbar.dart';
import '../../home/bindings/home_binding.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  bool rememberMe = false;
  var box = Hive.box('myBox');
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    rememberMe = true;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (authController) => Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.kAppIcon,
                    height: 100.h,
                    width: 100.w,
                  ),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: MyFonts.headline3TextSize,
                      fontWeight: FontWeight.w500,
                      color: theme.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    controller: authController.userName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a username";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: theme.primaryColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: theme.primaryColor,
                        ),
                      ),
                      fillColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide:
                            BorderSide(color: theme.primaryColor, width: 1.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        borderSide:
                            BorderSide(width: 1.w, color: theme.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: authController.password,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^.{4,}").hasMatch(value)) {
                        return "Password must be at least 4 charecter";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: theme.primaryColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: theme.primaryColor,
                        ),
                      ),
                      fillColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide:
                            BorderSide(color: theme.primaryColor, width: 1.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        borderSide:
                            BorderSide(width: 1.w, color: theme.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          rememberMe = !rememberMe;
                        },
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                          height: 16.h,
                          child: rememberMe
                              ? SvgPicture.asset(
                                  AppImages.iconTickedYes,
                                  fit: BoxFit.cover,
                                  color: theme.primaryColor,
                                )
                              : SvgPicture.asset(
                                  AppImages.iconTickedNo,
                                  fit: BoxFit.cover,
                                  color: theme.primaryColor,
                                ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          'Remember Me',
                          style: TextStyle(
                            fontSize: MyFonts.captionTextSize,
                            fontWeight: FontWeight.w500,
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          authController.login(authController.userName.text,
                              authController.password.text, true);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: Size(240.w, 52.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.r),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: MyFonts.headline5TextSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
