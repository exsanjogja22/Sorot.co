import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../config/app_api_response.dart';
import '../../../config/app_colors.dart';
import '../../../data/providers/profil_provider.dart';

class ProfilController extends GetxController {
  RxString nama = ''.obs;
  RxString kelas = ''.obs;
  RxString imageProfil = ''.obs;

  final ProfilProvider profilProvider = ProfilProvider();

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

  @override
  void onInit() {
    getDataProfil();
    super.onInit();
  }
}
