import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  // make fun to navigate to home page with delay 3 seconds
  void splashScreenNavigate() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed('/login'),
    );
  }

  @override
  void onInit() {
    super.onInit();
    splashScreenNavigate();
  }
}
