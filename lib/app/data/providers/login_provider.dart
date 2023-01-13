import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../config/app_enpoint_path.dart';
import '../../config/app_api_response.dart';
import '../../config/app_token.dart';
import '../../data/models/login_model.dart';

class LoginProvider {
  AppResponseApi appResponseApi = AppResponseApi.init;
  AppApiAuth appApiAuth = AppApiAuth();

  Login? login;
  String? message;

  Future<void> postLogin(String username, String password) async {
    appResponseApi = AppResponseApi.loading;
    try {
      final response = await http
          .post(Uri.parse(PathEnpoint.api + PathEnpoint.login), body: {
        'username': username,
        'password': password,
        'user_type': 'siswa'
      });
      if (response.statusCode == 200) {
        login = Login.fromJson(jsonDecode(response.body));
        if (login!.status == true) {
          await appApiAuth.addToken(login!.token!);
          appResponseApi = AppResponseApi.sucess;
        } else {
          message = "Username & password tidak boleh kosong";
          appResponseApi = AppResponseApi.field;
        }
      } else if (response.statusCode == 402) {
        var data = Login.fromJson(jsonDecode(response.body));

        message = data.pesan;
        appResponseApi = AppResponseApi.field;
      } else {
        message = "Terjadi Kesalahan Server";
        appResponseApi = AppResponseApi.field;
      }
    } on TimeoutException catch (_) {
      message = "TimeOut details";
      appResponseApi = AppResponseApi.field;
    } on SocketException {
      message = "No Internet connection";
      appResponseApi = AppResponseApi.field;
    }
  }
}
