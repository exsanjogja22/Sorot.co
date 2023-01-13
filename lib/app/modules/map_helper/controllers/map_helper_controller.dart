import 'dart:async';
import 'package:app_settings/app_settings.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../config/app_api_response.dart';
import '../../../data/providers/presensi_harian_provider.dart';
import '../../../config/app_location_service.dart';
import '../../../data/providers/config_provider.dart';
import '../../mainpage/controllers/mainpage_controller.dart';

class MapHelperController extends GetxController {
  RxBool isLoading = false.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxDouble systemLatitude = (-7.8687593385440910).obs;
  RxDouble systemLongitude = 110.39520564055954.obs;
  RxDouble systemRadius = 0.0.obs;

  final LocationService locationService = LocationService();
  final PresensiHarianProvider presensiHarianProvider =
      PresensiHarianProvider();
  final mainpageController = Get.put(MainpageController());
  final ConfigProvider configProvider = ConfigProvider();
  Completer<GoogleMapController> controllerMap = Completer();
  GoogleMapController? controller;

  Future<void> goToTheLake(double latitude, double longitude) async {
    final GoogleMapController controller = await controllerMap.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(latitude, longitude), zoom: 16.0)));
  }

  getDataConfig() async {
    await configProvider.getConfig();
    if (configProvider.appResponseApi == AppResponseApi.sucess) {
      systemLatitude.value = configProvider.config!.data!.systemLatitude!;
      systemLongitude.value = configProvider.config!.data!.systemLongitude!;
      systemRadius.value =
          configProvider.config!.data!.systemRadius!.toDouble();
      goToTheLake(configProvider.config!.data!.systemLatitude!,
          configProvider.config!.data!.systemLongitude!);
    } else {
      if (kDebugMode) {
        print(configProvider.message);
      }
    }
  }

  postPresensiHarian(BuildContext context, String t) async {
    isLoading.value = true;
    var status = await Permission.locationAlways.status;
    var status2 = await Permission.locationWhenInUse.status;
    bool jailbroken = await FlutterJailbreakDetection.jailbroken;
    bool developerMode = await FlutterJailbreakDetection.developerMode;
    if (!status.isGranted && !status2.isGranted) {
      isLoading.value = false;
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Gagal",
          text: "Hidupkan Gps anda pastikan gps anda mode akurasi tinggi",
          confirmBtnTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          onConfirmBtnTap: () async {
            await Permission.locationAlways.request();
            await Permission.locationWhenInUse.request();
            AppSettings.openLocationSettings();
            Get.back();
          });
    } else {
      if (jailbroken == true && developerMode == true) {
        isLoading.value = false;
        CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          title: "Peringatan",
          text:
              "Matikan fitur opsi pengembang pada pengaturan hp anda, apabila tidak bisa gunakan perangkat lain yang tidak di modifikasi",
          confirmBtnTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          onConfirmBtnTap: () async {
            AppSettings.openDevelopmentSettings();
            Get.back();
          },
        );
      } else {
        await presensiHarianProvider.postPresensiHarian(
            latitude.value, longitude.value, t);
        if (presensiHarianProvider.appResponseApi2 == AppResponseApi.sucess) {
          isLoading.value = false;
          CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              title: "Berhasil",
              text: "Kamu berhasil absen!",
              confirmBtnTextStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              onConfirmBtnTap: () {
                mainpageController.initPresensiHarian =
                    mainpageController.getDataPresensiHarian();
                mainpageController.update([0]);
                Get.back();
                Get.back();
              });
        } else {
          isLoading.value = false;
          CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "Gagal",
            text: presensiHarianProvider.message2,
            confirmBtnTextStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            onConfirmBtnTap: () {
              Get.back();
              Get.back();
            },
          );
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDataConfig();
    locationService.locationStream.listen((userLocation) {
      latitude.value = userLocation.latitude!;
      longitude.value = userLocation.longtitude!;
    });
  }

  @override
  void dispose() {
    super.dispose();
    locationService.dispose();
  }
}
