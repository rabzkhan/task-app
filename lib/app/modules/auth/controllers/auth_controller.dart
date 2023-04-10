import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:task_app/app/service/base_controller.dart';
import '../../../components/navbar/bottom_navbar.dart';
import '../../../service/api_urls.dart';
import '../../../service/dio_client.dart';
import '../../home/bindings/home_binding.dart';

class AuthController extends GetxController with BaseController {
  // final _myBox = Hive.box('mybox');
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();

  login(String userName, String password, bool rememberMe) async {
    var request = {
      "username": userName,
      "password": password,
      "rememberMe": true,
    };
    showLoading();
    var response = await DioClient()
        .post(url: ApiUrl.login, body: request)
        .catchError(handleError);
    if (response == null) return;
    //reload();
    hideLoading();
    if (response.statusCode == 200) {
      var box = Hive.box('myBox');
      box.put('token', response.data['id_token']);
      Get.to(BottomNavbar(), binding: HomeBinding());
      print(box.get('token'));
    }
  }
}
