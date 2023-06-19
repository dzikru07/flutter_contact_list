import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_contact_list/pages/home/controller/home_controller.dart';
import 'package:flutter_contact_list/pages/home/model/list_data_model/datum.dart';
import 'package:get/get.dart';

class FormAddController extends GetxController {
  RxList genderList = <String>['Male', 'Female'].obs;

  RxList avatarList = <String>[
    'https://robohash.org/abeiusfugit.png?size=50x50&set=set1',
    'https://robohash.org/facerenequeet.png?size=50x50&set=set1',
    'https://robohash.org/etdoloremquevoluptatem.png?size=50x50&set=set1',
  ].obs;

  RxInt avatarInit = 0.obs;

  String genderInit = 'Male';

  RxString Firsname = ''.obs;
  RxString Lastname = ''.obs;
  RxString Email = ''.obs;
  RxString Phone = ''.obs;

  // make fun to add data from homcontroller list data using var above
  addUser() {
    HomeController homeController = Get.find();
    homeController.listData.add(Datum(
      id: homeController.listData.length + 1,
      firstName: Firsname.value,
      lastName: Lastname.value,
      email: Email.value,
      gender: genderInit,
      avatar: avatarList[avatarInit.value],
    ));
    inspect(homeController.listData);
    homeController.listData.refresh();
    Get.snackbar(
      'Success',
      'Add Data Success',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Get.offAllNamed('/home');
  }
}
