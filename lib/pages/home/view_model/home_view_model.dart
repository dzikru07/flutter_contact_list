import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_contact_list/pages/home/model/list_data_model/list_data_model.dart';
import 'package:http/http.dart' as http;

import '../../../service/api.dart';

class ServiceHomePage {
  final ApiService _apiService = ApiService();

  getListData() async {
    try {
      http.Response response = await _apiService
          .getApiData("/api/contacts")
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return ListDataModel.fromJson(jsonDecode(response.body));
      } else {
        return ListDataModel.fromJson(jsonDecode(response.body));
      }
      // rest of the code
    } on TimeoutException catch (e) {
      return ListDataModel(
        success: 0,
        data: [],
      );
    } on SocketException catch (e) {
      return ListDataModel(
        success: 0,
        data: [],
      );
    }
  }
}
