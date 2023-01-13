import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import '../../config/app_enpoint_path.dart';
import '../../config/app_api_response.dart';
import '../../config/app_token.dart';
import '../../routes/app_pages.dart';
import '../models/config_model.dart';
import 'package:http/http.dart' as http;

class ConfigProvider {
  AppResponseApi appResponseApi = AppResponseApi.init;
  AppApiAuth appApiAuth = AppApiAuth();
  Config? config;
  String? message;

  Future<void> getConfig() async {
    appResponseApi = AppResponseApi.loading;
    try {
      final token = await appApiAuth.getToken();
      final response = await http.get(
          Uri.parse(
              PathEnpoint.api + PathEnpoint.absensi + PathEnpoint.configsiswa),
          headers: {'Authorization': token!});
      if (response.statusCode == 200) {
        config = Config.fromJson(jsonDecode(response.body));
        appResponseApi = AppResponseApi.sucess;
      } else if (response.statusCode == 402) {
        message = "Login Gagal";
        appResponseApi = AppResponseApi.field;
        Get.offAllNamed(Routes.LOGIN);
      } else {
        message = "${response.statusCode} : Terjadi Kesalahan Server";
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

  // Future<Response<Config>> postConfig(Config config) async =>
  //     await post('config', config);
  // Future<Response> deleteConfig(int id) async => await delete('config/$id');
}
