import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/providers/surat_izin_provider.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../data/models/presensi_harian_model.dart';
import '../../../data/providers/config_provider.dart';
import '../../../data/providers/presensi_harian_provider.dart';
import '../../../config/app_api_response.dart';
import '../../../data/models/config_model.dart';
import '../../../data/models/presensi_kegiatan_model.dart';
import '../../../data/providers/presensi_kegiatan_provider.dart';
import '../../../data/providers/profil_provider.dart';

class MainpageController extends GetxController {
  RxInt selectedItems = 0.obs;
  RxString nama = ''.obs;
  RxString kelas = ''.obs;
  RxString imageProfil = ''.obs;
  RxString basename = ' No Choosen file'.obs;
  String? selectedIzin;
  File? file;

  final pageControl = PageController();
  final PresensiHarianProvider presensiHarianProvider =
      PresensiHarianProvider();
  final ProfilProvider profilProvider = ProfilProvider();
  final ConfigProvider configProvider = ConfigProvider();
  final SuratIzinProvider suratIzinProvider = SuratIzinProvider();
  final PresensiKegiatanProvider presensiKegiatanProvider =
      PresensiKegiatanProvider();

  Future<PresensiKegiatan?>? initPresensiKegiatan;
  Future<PresensiHarian?>? initPresensiHarian;
  Future<Config?>? initConfig;

  ontapKonten(int index) {
    selectedItems.value = index;
    update();
    pageControl.animateToPage(selectedItems.value,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    update();
  }

  List izin = [
    {
      "title": "Sakit",
      "id": "S",
    },
    {
      "title": "Izin",
      "id": "I",
    },
  ];

  List menu = [
    {
      "title": "Presensi Harian",
      "image": AppImages.tabPresensi1,
      "image2": "assets/icons/menu_presensi/tanggal.png",
    },
    {
      "title": "Presensi Kegiatan",
      "image": AppImages.tabPresensi1,
      "image2": "assets/icons/menu_presensi/tanggal.png",
    },
    {
      "title": "Report Presensi",
      "image": AppImages.tabPresensi2,
      "image2": 'assets/icons/menu_presensi/trend.png',
    },
  ];

  Future<PresensiKegiatan?> getPresensiKegiatan() async {
    await presensiKegiatanProvider.getPresensiKegiatan();
    if (presensiKegiatanProvider.appResponseApi == AppResponseApi.sucess) {
      return presensiKegiatanProvider.presensiKegiatan;
    } else {
      Get.snackbar("Peringatan", presensiKegiatanProvider.message!,
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.red,
          backgroundColor: AppColors.red.withOpacity(0.4));
      if (kDebugMode) {
        print(presensiKegiatanProvider.message);
      }
    }
    return null;
  }

  Future<void> getDataProfil() async {
    await profilProvider.getProfil();
    if (profilProvider.appResponseApi == AppResponseApi.sucess) {
      nama.value = profilProvider.profil!.biodata!.namaSiswa!;
      kelas.value = "Jurnalis";
      imageProfil.value = profilProvider.profil!.biodata!.photo!;
    } else {
      Get.snackbar("Peringatan", profilProvider.message!,
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.red,
          backgroundColor: AppColors.red.withOpacity(0.4));
      if (kDebugMode) {
        print(profilProvider.message);
      }
    }
  }

  Future<PresensiHarian?> getDataPresensiHarian() async {
    await presensiHarianProvider.getPresensiHarian();
    if (presensiHarianProvider.appResponseApi == AppResponseApi.sucess) {
      return presensiHarianProvider.presensiHarian;
    } else {
      Get.snackbar("Peringatan", presensiHarianProvider.message!,
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.red,
          backgroundColor: AppColors.red.withOpacity(0.4));
      if (kDebugMode) {
        print(presensiHarianProvider.message);
      }
    }
    return null;
  }

  Future<Config?> getDataConfig() async {
    await configProvider.getConfig();
    if (configProvider.appResponseApi == AppResponseApi.sucess) {
      return configProvider.config;
    } else {
      Get.snackbar("Peringatan", configProvider.message!,
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.red,
          backgroundColor: AppColors.red.withOpacity(0.4));
      if (kDebugMode) {
        print(configProvider.message);
      }
    }
    return null;
  }

  postDataSuratIzin(BuildContext context) async {
    if (file != null && selectedIzin != null) {
      await suratIzinProvider.postSuratIzin(selectedIzin!, file!.path);
      if (suratIzinProvider.appResponseApi == AppResponseApi.sucess) {
        if (suratIzinProvider.suratIzin!.status == true) {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            title: "Sukses",
            text: suratIzinProvider.suratIzin!.pesan,
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
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Gagal",
          text: suratIzinProvider.suratIzin!.pesan,
          confirmBtnTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          onConfirmBtnTap: () {
            Get.back();
          },
        );
      } else {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Gagal",
          text: suratIzinProvider.message,
          confirmBtnTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          onConfirmBtnTap: () {
            Get.back();
          },
        );
      }
    } else {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          title: "Peringatan",
          text: "Anda belum memilih file & jenis izin",
          confirmBtnTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          onConfirmBtnTap: () {
            Get.back();
          });
    }
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    basename.value = path.split('/').last;
    file = File(path);
  }

  @override
  void onInit() {
    initPresensiKegiatan = getPresensiKegiatan();
    initPresensiHarian = getDataPresensiHarian();
    initConfig = getDataConfig();
    getDataProfil();
    super.onInit();
  }

  @override
  void dispose() {
    pageControl.dispose();
    super.dispose();
  }
}
