import 'package:flutter/material.dart' as android;
import 'package:flutter/cupertino.dart' as ios;
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  android.PageController? pageControllerAndroid;
  ios.PageController? pageControllerIos;
  RxInt currentPage = 0.obs;
  RxInt numPages = 3.obs;

  @override
  void onInit() {
    super.onInit();
    if (GetPlatform.isAndroid) {
      pageControllerAndroid = android.PageController(initialPage: 0);
    } else {
      pageControllerIos = ios.PageController(initialPage: 0);
    }
  }
}
