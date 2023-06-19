import 'package:flutter/material.dart';
import 'package:flutter_contact_list/pages/home/model/list_data_model/datum.dart';
import 'package:flutter_contact_list/pages/home/view_model/home_view_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList listData = <Datum>[].obs;
  RxBool isLoading = false.obs;

  final ServiceHomePage _service = ServiceHomePage();

  Future getListData() async {
    isLoading.value = true;
    final data = await _service.getListData();
    listData.value = data.data!;
    if (data.success == 1) {
      Get.snackbar(
        'Success',
        'Get Data Success',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Failed',
        data.errorMessage!,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getListData();
  }
}
