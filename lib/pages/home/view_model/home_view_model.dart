import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_contact_list/pages/login/model/login_model.dart';
import 'package:http/http.dart' as http;

import '../../../service/api.dart';

class ServiceHomePage {
  final ApiService _apiService = ApiService();

  getListData(String user, String password) async {
    try {
    
      http.Response response = await _apiService
          .getApiData("/apporder/api/login")
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return loginModelFromJson(response.body);
      } else {
        return loginModelFromJson(response.body);
      }
      // rest of the code
    } on TimeoutException catch (e) {
      return LoginModel(success: 0, errorMessage: e.toString());
    } on SocketException catch (e) {
      return LoginModel(success: 0, errorMessage: e.toString());
    }
  }
}
