import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/app/modules/home/controllers/home_controller.dart';

import '../../../components/custom_snackbar.dart';
import '../../../service/api_urls.dart';
import '../../../service/base_controller.dart';
import '../../../service/dio_client.dart';

class AddProductController extends GetxController with BaseController {
  TextEditingController pName = TextEditingController();
  TextEditingController pDescription = TextEditingController();
  TextEditingController pPrice = TextEditingController();
  TextEditingController pQuantity = TextEditingController();
  TextEditingController pImage = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  addPorduct() async {
    print(pName.text);
    var request = {
      "name": pName.text,
      "barcode": "string",
      "description": pDescription.text,
      "image": "string",
      "subCategory": 1851,
      "brand": 1901,
      "quantity": {
        "quantity": pQuantity.text,
        "unit": "string",
        "unitValue": 0,
        "pastQuantity": 0
      },
      "productPrice": {"price": pPrice.text, "unitPrice": 0, "mrp": 0}
    };
    showLoading();
    var response = await DioClient()
        .postWithToken(url: ApiUrl.addProducts, body: request)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    Get.find<HomeController>().getProductList();
    Get.back();
    CustomSnackBar.showCustomSnackBar(
        title: "Product", message: "Succefully added!");
    pName.clear();
    pDescription.clear();
    pPrice.clear();
    pQuantity.clear();
    pImage.clear();
  }
}
