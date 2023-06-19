import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_contact_list/pages/login/model/login_model.dart';
import 'package:http/http.dart' as http;

import '../../../service/api.dart';

class ServiceLoginPage {
  final ApiService _apiService = ApiService();

  postLoginUser(String user, String password) async {
    try {
      var param = jsonEncode({"username": user, "password": password});
      http.Response response = await _apiService
          .postApiData("/apporder/api/login", param)
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
