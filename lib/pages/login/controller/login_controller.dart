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
    loginModel = await _service.postLoginUser(username.value, password.value);
    return loginModel;
  }
}
