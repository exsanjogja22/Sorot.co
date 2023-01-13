import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/app_enpoint_path.dart';
import '../../config/app_api_response.dart';
import '../../config/app_token.dart';
import '../../routes/app_pages.dart';
import '../models/presensi_kegiatan_model.dart';

class PresensiKegiatanProvider {
  AppResponseApi appResponseApi = AppResponseApi.init;
  AppApiAuth appApiAuth = AppApiAuth();
  PresensiKegiatan? presensiKegiatan;
  String? message;

  Future<void> getPresensiKegiatan() async {
    appResponseApi = AppResponseApi.loading;
    try {
      final token = await appApiAuth.getToken();
      final response = await http.get(
          Uri.parse(PathEnpoint.api + PathEnpoint.absensiKegiatan),
          headers: {'Authorization': token!});
      if (response.statusCode == 200) {
        presensiKegiatan = PresensiKegiatan.fromJson(jsonDecode(response.body));
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

  // Future<Response<PresensiKegiatan>> postPresensiKegiatan(
  //         PresensiKegiatan presensikegiatan) async =>
  //     await post('presensikegiatan', presensikegiatan);
  // Future<Response> deletePresensiKegiatan(int id) async =>
  //     await delete('presensikegiatan/$id');
}
