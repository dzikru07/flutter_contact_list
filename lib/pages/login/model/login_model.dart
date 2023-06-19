// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? success;
  String? token;
  int? userId;
  String? errorMessage;

  LoginModel({
    this.success,
    this.token,
    this.userId,
    this.errorMessage,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        token: json["token"],
        userId: json["user_id"],
        errorMessage: json["error_message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "token": token,
        "user_id": userId,
        "error_message": errorMessage,
      };
}
