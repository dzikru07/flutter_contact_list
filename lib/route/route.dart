// make route using getx
import 'package:flutter_contact_list/pages/login/view/login_page.dart';
import 'package:get/get.dart';

import '../pages/home/view/home_page.dart';
import '../pages/splash_screen/view/splash_screen.dart';

class AppRoute {
  static const initialRoute = '/';

  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(
      name: '/home',
      page: () => const HomePage(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
    ),
  ];
}
