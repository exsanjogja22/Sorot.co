import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: AppColors.blueDrak,
          elevation: 0,
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Image.asset(
                AppImages.logo,
                height: 100.h,
                width: 200.w,
                color: AppColors.blueDrak,
              ),
              Text(
                "Selamat datang",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Silahkan masuk dengan akun anda yang sudah terdaftar\ndi aplikasi manajemen_smn.sorot.co untuk mengakses aplikasi",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Username",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffE9E9E9),
                    borderRadius: BorderRadius.circular(10.r)),
                child: TextField(
                  controller: controller.username,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.poppins(color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: "Masukan Username",
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey, fontSize: 12.sp),
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.person),
                    helperStyle: GoogleFonts.poppins(
                      color: Colors.black38,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffE9E9E9),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Obx(
                  () => TextField(
                    obscureText: controller.isObscure.value,
                    controller: controller.password,
                    keyboardType: TextInputType.visiblePassword,
                    style: GoogleFonts.poppins(color: Colors.black87),
                    decoration: InputDecoration(
                      hintText: "Masukan Password",
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.grey, fontSize: 12.sp),
                      prefixIcon: const Icon(Icons.key),
                      prefixIconColor: AppColors.blueDrak,
                      suffixIcon: IconButton(
                        icon: controller.isObscure.value
                            ? const Icon(Icons.visibility_off,
                                size: 20, color: Colors.grey)
                            : const Icon(
                                Icons.visibility,
                                size: 20,
                                color: AppColors.blueDrak,
                              ),
                        onPressed: () {
                          controller.isObscure.value =
                              !controller.isObscure.value;
                        },
                      ),
                      border: InputBorder.none,
                      helperStyle: GoogleFonts.poppins(
                        color: Colors.black38,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lupa Passwword ?',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueDrak,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 45.h,
                child: Obx(
                  () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blueDrak,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {
                      if (controller.isLoading.isFalse) {
                        controller.login();
                      }
                    },
                    child: controller.isLoading.isFalse
                        ? Text(
                            'Sign in',
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Loading.... ",
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              SizedBox(
                                height: 8.h,
                                width: 8.w,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
