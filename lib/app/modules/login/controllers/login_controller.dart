import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_api_response.dart';
import '../../../data/providers/login_provider.dart';
import '../../../routes/app_pages.dart';
import '../../../config/app_colors.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isObscure = true.obs;
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final LoginProvider loginProvider = LoginProvider();

  void login() async {
    isLoading.value = true;

    await loginProvider.postLogin(username.text, password.text);
    if (loginProvider.appResponseApi == AppResponseApi.sucess) {
      Get.offAllNamed(Routes.MAINPAGE);
      Get.snackbar("Berhasil", "Berhasil Login",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.blueDrak,
          backgroundColor: AppColors.blueWhite);
      isLoading.value = false;
    } else if (loginProvider.appResponseApi == AppResponseApi.field) {
      Get.snackbar("Gagal", loginProvider.message!,
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.red,
          backgroundColor: AppColors.red.withOpacity(0.4));
      isLoading.value = false;
    }
  }
}
