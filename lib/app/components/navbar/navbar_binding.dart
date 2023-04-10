import 'package:get/get.dart';
import 'package:task_app/app/modules/Page2/controllers/page2_controller.dart';
import 'package:task_app/app/modules/Page3/controllers/page3_controller.dart';
import 'package:task_app/app/modules/home/controllers/home_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<Page2Controller>(
      () => Page2Controller(),
    );
    Get.lazyPut<Page3Controller>(
      () => Page3Controller(),
    );
  }
}
