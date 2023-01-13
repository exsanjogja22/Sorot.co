import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/app_enpoint_path.dart';
import '../../routes/app_pages.dart';
import '../../config/app_api_response.dart';
import '../../config/app_token.dart';
import '../models/presensi_harian_model.dart';

class PresensiHarianProvider {
  AppResponseApi appResponseApi = AppResponseApi.init;
  AppResponseApi appResponseApi2 = AppResponseApi.init;
  AppApiAuth appApiAuth = AppApiAuth();
  PresensiHarian? presensiHarian;
  String? message;
  String? message2;

  Future<void> getPresensiHarian() async {
    appResponseApi = AppResponseApi.loading;
    try {
      final token = await appApiAuth.getToken();
      final response = await http.get(
          Uri.parse(PathEnpoint.api + PathEnpoint.absensi),
          headers: {'Authorization': token!});
      if (response.statusCode == 200) {
        presensiHarian = PresensiHarian.fromJson(jsonDecode(response.body));
        appResponseApi = AppResponseApi.sucess;
      } else if (response.statusCode == 401) {
        appResponseApi = AppResponseApi.field;
        message = "Login Gagal";
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

  Future<void> postPresensiHarian(
      double latitude, double longitude, String t) async {
    appResponseApi2 = AppResponseApi.loading;
    try {
      final token = await appApiAuth.getToken();
      final response = await http.post(
        Uri.parse(PathEnpoint.api + PathEnpoint.absensi),
        headers: {'Authorization': token!},
        body: {'latitude': '$latitude', 'longitude': '$longitude', 't': t},
      );
      if (response.statusCode == 200) {
        var it = jsonDecode(response.body);
        if (it['status'] == true) {
          message2 = it['pesan'];
          appResponseApi2 = AppResponseApi.sucess;
        } else {
          message2 = it['pesan'];
          appResponseApi2 = AppResponseApi.field;
        }
      } else if (response.statusCode == 401) {
        appResponseApi2 = AppResponseApi.field;
        message2 = "Login Gagal";
        Get.offAllNamed(Routes.LOGIN);
      } else {
        message2 = "${response.statusCode} : Terjadi Kesalahan Server";
        appResponseApi2 = AppResponseApi.field;
      }
    } on TimeoutException catch (_) {
      message2 = "TimeOut details";
      appResponseApi2 = AppResponseApi.field;
    } on SocketException {
      message2 = "No Internet connection";
      appResponseApi2 = AppResponseApi.field;
    }
  }

  // Future<Response> deletePresensiHarian(int id) async =>
  //     await delete('presensiharian/$id');
}
