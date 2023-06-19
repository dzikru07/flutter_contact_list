import 'package:flutter/material.dart';
import 'package:flutter_contact_list/pages/splash_screen/controller/splash_screen_controller.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../style/color.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenController splashScreenController = Get.find();

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            Image.asset(
              'assets/images/logo.png',
              width: width / 3,
            ),
            LoadingAnimationWidget.discreteCircle(
              color: mainColor,
              size: width / 12,
            ),
          ],
        ),
      ),
    );
  }
}
