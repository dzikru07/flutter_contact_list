import 'package:flutter/material.dart';
import 'package:flutter_contact_list/pages/splash_screen/view/splash_screen.dart';
import 'package:flutter_contact_list/route/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'binding/master_binding.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tonjoo Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.initialRoute,
      getPages: AppRoute.routes,
      home: SplashScreen(),
      initialBinding: MasterBinding(),
    );
  }
}
