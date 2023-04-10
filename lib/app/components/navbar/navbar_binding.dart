import 'package:get/get.dart';

import '../../modules/addProduct/controllers/add_product_controller.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../../modules/profile/controllers/profile_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AddProductController>(
      () => AddProductController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.put(ProfileController(), permanent: true);
  }
}
