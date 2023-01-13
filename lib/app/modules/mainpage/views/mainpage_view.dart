import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/mainpage_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../modules/mainpage/views/presensi_harian_view.dart';
import '../../../modules/mainpage/views/presensi_kegitan_view.dart';
import '../../../modules/mainpage/views/presensi_report_view.dart';

class MainpageView extends GetView<MainpageController> {
  const MainpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F5FA),
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
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 260.h,
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: AppColors.gradientColors),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r),
                      ),
                    ),
                    child: Obx(
                      () => Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.PROFIL);
                                },
                                child: controller.imageProfil.value != ""
                                    ? CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                            controller.imageProfil.value),
                                      )
                                    : const CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            AssetImage(AppImages.profileTumb),
                                      ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Presensi Pegawai",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.white.withOpacity(0.4),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10.r),
                                      onTap: () {},
                                      child: Container(
                                        height: 35.h,
                                        width: 35.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Icon(
                                          Icons.notifications_active,
                                          size: 20.h,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 75.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Text(
                                controller.nama.value.toTitleCase(),
                                style: GoogleFonts.poppins(
                                    color: AppColors.blueWhite,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => Text(
                                  controller.kelas.value,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                    color: Colors.black.withOpacity(0.15))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Material(
                                      color: AppColors.blueDrak,
                                      borderRadius: BorderRadius.circular(10),
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.MAP_HELPER,
                                              arguments: ["masuk"]);
                                        },
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Image.asset(
                                                      AppImages.presensiMasuk,
                                                      height: 20,
                                                      width: 20,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Masuk",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Material(
                                      color: AppColors.blueLight,
                                      borderRadius: BorderRadius.circular(10),
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.MAP_HELPER,
                                              arguments: ["pulang"]);
                                        },
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Image.asset(
                                                      AppImages.presensiPulang,
                                                      height: 20,
                                                      width: 20,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Pulang",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColors.greeDrak,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10.r),
                                  onTap: () {
                                    showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return PopUpSuratIzin(
                                          controller: controller,
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 50.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.email,
                                          size: 20.w,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          'Ajukan Surat Izin',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    controller.menu.length,
                    (index) => InkWell(
                      onTap: () {
                        controller.ontapKonten(index);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.h,
                          vertical: 10.w,
                        ),
                        decoration: BoxDecoration(
                          color: controller.selectedItems.value == index
                              ? AppColors.blueDrak
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 110.h,
                        width: 90.w,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  controller.menu[index]["image"],
                                  color: controller.selectedItems.value == index
                                      ? Colors.white
                                      : AppColors.greeDrak,
                                  height: 45.h,
                                  width: 45.w,
                                ),
                                Positioned(
                                  top: 12,
                                  left: 13,
                                  child: Image.asset(
                                    controller.menu[index]["image2"],
                                    color:
                                        controller.selectedItems.value == index
                                            ? AppColors.blueDrak
                                            : Colors.white,
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              controller.menu[index]["title"],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: controller.selectedItems.value == index
                                    ? Colors.white
                                    : AppColors.greeDrak,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageControl,
                  children: [
                    PresensiHarianView(controller),
                    PresensiKegitanView(controller),
                    const PresensiReportView()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopUpSuratIzin extends StatelessWidget {
  const PopUpSuratIzin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MainpageController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 475.h,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Column(
          children: [
            SizedBox(
              height: 25.h,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: 450.h,
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.blueDrak,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          AppImages.bakground2,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.ilustration,
                              width: 175.w,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Hari ini berhalangan hadir?",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Upload surat izinmu disini",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Material(
                                    color: AppColors.blueLight,
                                    borderRadius: BorderRadius.circular(10),
                                    child: InkWell(
                                      onTap: () {
                                        controller.selectFile();
                                      },
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: 137.h,
                                        height: 30.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Choose file",
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Icon(
                                              Icons.folder_open_outlined,
                                              color: Colors.white,
                                              size: 20.w,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Keterangan surat izin :",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  GetBuilder<MainpageController>(
                                    id: 3,
                                    builder: (_) {
                                      return Container(
                                        width: 137.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.w, right: 10),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              hint: Text(
                                                'Keterangan',
                                                style: GoogleFonts.poppins(
                                                  color: AppColors.blueDrak,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              dropdownColor: Colors.white,
                                              value: controller.selectedIzin,
                                              items: controller.izin.map(
                                                (value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value:
                                                        value["id"].toString(),
                                                    child: Text(
                                                      value["title"],
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            AppColors.blueDrak,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              icon: Icon(
                                                Icons.arrow_drop_down_outlined,
                                                size: 20.w,
                                                color: AppColors.blueDrak,
                                              ),
                                              onChanged: (value) {
                                                controller.selectedIzin =
                                                    value!;
                                                controller.update([3]);
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Material(
                                      color: AppColors.greeDrak,
                                      borderRadius: BorderRadius.circular(10),
                                      child: InkWell(
                                        onTap: () {
                                          controller.postDataSuratIzin(context);
                                        },
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Kirim",
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        controller.basename.value,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tipe file yang diizinkan : jpg, jpeg, png",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Ukuran maksimal file : 3 MB",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 32.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 28.w,
              backgroundColor: AppColors.blueDrak,
              child: Image.asset(
                AppImages.iconsSurat,
                width: 30.h,
              ),
            ),
          ),
        )
      ]),
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
