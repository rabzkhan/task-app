import 'package:get/get.dart';
import 'package:task_app/app/service/base_controller.dart';

import '../../../service/api_urls.dart';
import '../../../service/dio_client.dart';
import '../model/product_model.dart';

class HomeController extends GetxController with BaseController {
  final productList = RxList<ProductModel>();
  @override
  void onInit() {
    getPostList();
    super.onInit();
  }

  getPostList() async {
    // showLoading();
    var response =
        await DioClient().get(url: ApiUrl.products).catchError(handleError);
    if (response == null) return;
    productList.assignAll(
        (response.data as List).map((e) => ProductModel.fromJson(e)).toList());

    // hideLoading();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
