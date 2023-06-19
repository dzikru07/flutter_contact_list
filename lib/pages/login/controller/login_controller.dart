import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/login_model.dart';
import '../view_model/login_view_models.dart';

class LoginController extends GetxController {
  RxString username = ''.obs;
  RxString password = ''.obs;
  RxBool isLoading = false.obs;

  LoginModel loginModel = LoginModel();

  final ServiceLoginPage _service = ServiceLoginPage();

  // make function to login from api using view model
  Future login() async {
    isLoading.value = true;
    // final data = await _service.postLoginUser(username.value, password.value);
    // loginModel = data;
    // if (loginModel.success == 1) {
    //   Get.snackbar(
    //     'Login Success',
    //     'Welcome',
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.green,
    //     colorText: Colors.white,
    //   );
    // } else {
    //   Get.snackbar(
    //     'Login Failed',
    //     loginModel.errorMessage!,
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //   );
    // }
    Get.snackbar(
      'Login Success',
      'Welcome',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    await Future.delayed(Duration(seconds: 3), () {
      isLoading.value = false;
    });
    Get.offNamed('/home');
  }
}
