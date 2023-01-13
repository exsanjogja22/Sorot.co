import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '/app/config/app_enpoint_path.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/app_api_response.dart';
import '../../config/app_token.dart';
import '../../routes/app_pages.dart';
import '../models/surat_izin_model.dart';

class SuratIzinProvider {
  AppResponseApi appResponseApi = AppResponseApi.init;
  AppApiAuth appApiAuth = AppApiAuth();
  String? message;
  SuratIzin? suratIzin;

  Future<void> postSuratIzin(String type, String pathFile) async {
    appResponseApi = AppResponseApi.loading;
    try {
      final token = await appApiAuth.getToken();
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              PathEnpoint.api + PathEnpoint.absensi + PathEnpoint.suratizin));
      request.fields.addAll({'jenis_izin': type});
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        " /data/user/0/com.aricode.watulintang.aplikasi_menejement/cache/file_picker/IMG-20221211-WA0009.jpg",
      ));
      request.headers.addAll({'Authorization': token!});

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        suratIzin = SuratIzin.fromJson(
            jsonDecode(await response.stream.bytesToString()));
        appResponseApi = AppResponseApi.sucess;
      } else if (response.statusCode == 401) {
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
}
