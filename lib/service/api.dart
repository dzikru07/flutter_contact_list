// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final box = GetStorage();

  getUrl() {
    return 'private-anon-11c5490477-recruitment.apiary-mock.com';
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'application': 'x-www-form-urlencoded'
      };

  _setHeadersWithToken() => {
        'Content-type': 'application/json',
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'
      };

  Future getApiData(String path) async {
    await getUrl();
    var fullUrl = Uri.http(getUrl(), path);
    return await http.get(fullUrl, headers: _setHeadersWithToken());
  }

  Future postApiData(String path, var data) async {
    await getUrl();
    var fullUrl = Uri.http(
      getUrl(),
      path,
    );
    return await http.post(fullUrl, headers: _setHeaders(), body: data);
  }
}
