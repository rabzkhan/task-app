import 'package:get/get.dart';

import '../components/navbar/bottom_navbar.dart';
import '../components/navbar/navbar_binding.dart';
import '../modules/addProduct/bindings/add_product_binding.dart';
import '../modules/addProduct/views/add_product_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const AUTH = Routes.AUTH;
  static const Nav = Routes.NAV;
  static const HOME = Routes.HOME;

  static final routes = [
    /// NAV BAR
    GetPage(
      name: _Paths.NAV,
      page: () => BottomNavbar(),
      binding: NavbarBinding(),
    ),

    ///
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),

    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
        name: _Paths.PROFILE,
        page: () => const ProfileView(),
        binding: ProfileBinding(),
        children: [
          GetPage(
            name: _Paths.PROFILE,
            page: () => const ProfileView(),
            binding: ProfileBinding(),
          ),
        ]),
  ];
}
