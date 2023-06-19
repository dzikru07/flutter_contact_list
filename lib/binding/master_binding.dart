// make binding controller

import 'package:flutter_contact_list/pages/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_contact_list/pages/splash_screen/controller/splash_screen_controller.dart';

class MasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
