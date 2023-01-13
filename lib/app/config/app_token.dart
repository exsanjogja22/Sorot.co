import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_pages.dart';

class AppApiAuth {
  Future<void> addToken(String token) async {
    if (token.isNotEmpty) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      await localStorage.setString("token", token);
    }
  }

  Future<String?> getToken() async {
    SharedPreferences getToken = await SharedPreferences.getInstance();
    String? auth = getToken.getString("token");
    return auth;
  }

  void deleteToken() async {
    SharedPreferences delToken = await SharedPreferences.getInstance();
    await delToken.remove("token");
    Get.offAllNamed(Routes.LOGIN);
  }
}
