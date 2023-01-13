import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../config/app_token.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 125.h,
                    width: double.infinity.w,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: AppColors.gradientColors),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r),
                      ),
                    ),
                    height: 100.h,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              backgroundColor: AppColors.blueDrak,
                              radius: 14.50,
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Pengaturan",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      margin: EdgeInsets.only(
                        left: 15.w,
                        right: 15.w,
                        top: 70.h,
                      ),
                      height: 100.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: controller.imageProfil.value == ''
                                  ? CircleAvatar(
                                      radius: 30.r,
                                      backgroundColor: Colors.white,
                                      backgroundImage: const AssetImage(
                                          AppImages.profileTumb),
                                    )
                                  : CircleAvatar(
                                      radius: 30.r,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                        controller.imageProfil.value,
                                      ),
                                    ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.nama.value.toTitleCase(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        controller.kelas.value,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Pengaturan Akun",
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      onTap: () {},
                      title: Text(
                        "Akun Saya",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Image.asset(
                        "assets/icons/setings/ic_akun_saya.png",
                        width: 20.w,
                        height: 20.h,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.w,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      onTap: () {},
                      title: Text(
                        "Ubah Password",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Image.asset(
                        "assets/icons/setings/ic_ub_password.png",
                        width: 20.w,
                        height: 20.h,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Kontak Bantuan",
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      onTap: () {},
                      title: Text(
                        "Email Support",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Image.asset(
                        "assets/icons/setings/ic_email.png",
                        width: 20.w,
                        height: 20.h,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.w,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      onTap: () {},
                      title: Text(
                        "Whatsapp Support",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Image.asset(
                        "assets/icons/setings/ic_wa.png",
                        width: 20.w,
                        height: 20.h,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.w,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Aplikasi",
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      onTap: () {},
                      title: Text(
                        "About Me",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Image.asset(
                        "assets/icons/setings/ic_aboutme.png",
                        width: 20.w,
                        height: 20.h,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.w,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      onTap: () {},
                      title: Text(
                        "Kebijakan Privasi",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Image.asset(
                        "assets/icons/setings/ic_protect.png",
                        width: 20.w,
                        height: 20.h,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.w,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      onTap: () {},
                      title: Text(
                        "Syarat & Ketentuan",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Image.asset(
                        "assets/icons/setings/ic_syarat.png",
                        width: 20.w,
                        height: 20.h,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.w,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      onTap: () => AppApiAuth().deleteToken(),
                      title: Text(
                        "Log Out",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Image.asset(
                        "assets/icons/setings/ic_logout.png",
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
