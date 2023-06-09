import 'dart:convert';

import 'package:get/get.dart';
import 'package:task_app/app/modules/profile/model/profile_model.dart';

import '../../../service/api_urls.dart';
import '../../../service/base_controller.dart';
import '../../../service/dio_client.dart';

class ProfileController extends GetxController with BaseController {
  ProfileModel profileModel = ProfileModel();
  bool loader = false;
  void onInit() {
    getProfileData();
    super.onInit();
  }

  getProfileData() async {
    loader = true;
    update();
    showLoading();
    var response = await DioClient()
        .get(
          url: ApiUrl.profile,
        )
        .catchError(handleError);
    profileModel = ProfileModel.fromJson(response.data);
    update();
    hideLoading();
    loader = false;

    update();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await getProfileData();
    super.onReady();
  }
}
