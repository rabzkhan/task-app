import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/app/service/base_controller.dart';

import '../../../components/custom_snackbar.dart';
import '../../../service/api_urls.dart';
import '../../../service/dio_client.dart';
import '../model/product_model.dart';

class HomeController extends GetxController with BaseController {
  bool loader = false;
  final productList = RxList<ProductModel>();
  void onInit() async {
    await getProductList();
    super.onInit();
  }

  @override
  getProductList() async {
    loader = true;

    update();
    var response =
        await DioClient().get(url: ApiUrl.products).catchError(handleError);
    if (response == null) return;
    productList.assignAll(
        (response.data as List).map((e) => ProductModel.fromJson(e)).toList());
    loader = false;
    update();
  }

  deleteProduct(id) async {
    showLoading();
    var response = await DioClient()
        .delete(url: ApiUrl.deleteProducts + id.toString())
        .catchError(handleError);

    hideLoading();
    Get.back();
    getProductList();
    CustomSnackBar.showCustomSnackBar(
        title: "Product", message: "Succefully deleted!");
  }

  @override
  void onReady() async {
    super.onReady();
    await getProductList();
  }
}
