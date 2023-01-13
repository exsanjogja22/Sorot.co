import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../data/models/config_model.dart';
import '../../../modules/mainpage/controllers/mainpage_controller.dart';
import '../../../data/models/presensi_harian_model.dart';

class PresensiHarianView extends StatelessWidget {
  const PresensiHarianView(this.controller, {Key? key}) : super(key: key);
  final MainpageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Statistik Presensi Harian",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 140.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                        width: double.infinity,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 110.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: const Color(0xff5A90FF),
                            ),
                          ),
                          Positioned(
                            top: 10.h,
                            right: -15.w,
                            child: Image.asset(
                              AppImages.bakground1,
                              width: 194.47.w,
                              height: 103.86.h,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            height: 110.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.transparent,
                            ),
                            child: GetBuilder<MainpageController>(
                              id: 0,
                              builder: (_) {
                                return FutureBuilder<PresensiHarian?>(
                                  future: _.initPresensiHarian,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final data = snapshot.data!.data;
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Riwayat presensi hari ini",
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.sp,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        if (data!.waktuDatang !=
                                                            "")
                                                          Text(
                                                            "Jam datang: ${data.waktuDatang} WIB",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                        if (data.waktuDatang ==
                                                            "")
                                                          Text(
                                                            "Jam datang: 00:00:00 WIB",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.sp,
                                                            ),
                                                          )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        if (data.waktuPulang !=
                                                            "")
                                                          Text(
                                                            "Jam pulang: ${data.waktuPulang} WIB",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                        if (data.waktuPulang ==
                                                            "")
                                                          Text(
                                                            "Jam pulang: 00:00:00 WIB",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.sp,
                                                            ),
                                                          )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        if (data.statusDatang! !=
                                                            "")
                                                          Text(
                                                            data.statusDatang!,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                        if (data.statusDatang! ==
                                                            "")
                                                          Text(
                                                            "Belum Presensi",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.sp,
                                                            ),
                                                          )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        if (data.statusPulang! !=
                                                            "")
                                                          Text(
                                                            data.statusPulang!,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                        if (data.statusPulang! ==
                                                            "")
                                                          Text(
                                                            "Belum Presensi",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Riwayat presensi hari ini",
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.sp,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Jam datang: 00:00:00 WIB",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Jam pulang: 00:00:00 WIB",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "-",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: Colors.white,
                                                          fontSize: 12.sp,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "-",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: Colors.white,
                                                          fontSize: 12.sp,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 25.w,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 20.w,
                        backgroundColor: const Color(0xff5A90FF),
                        child: Icon(
                          Icons.timer_outlined,
                          size: 20.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Text(
                  "Aturan Presensi Harian",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 140,
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                        width: double.infinity,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 110.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: const Color(0xff5A90FF),
                            ),
                          ),
                          Positioned(
                            top: 10.h,
                            right: -15.w,
                            child: Image.asset(
                              AppImages.bakground1,
                              width: 194.47.w,
                              height: 103.86.h,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            height: 110.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.transparent,
                            ),
                            child: FutureBuilder<Config?>(
                              future: controller.initConfig,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final data = snapshot.data!.data;
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Aturan Presensi Harian",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Jam datang: ${data!.jamDatangAwal} s.d. ${data.jamDatangAkhir} WIB",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Jam datang: ${data.jamPulangAwal} s.d. ${data.jamPulangAkhir} WIB",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Riwayat presensi hari ini",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Jam datang: 00:00:00 s.d. 00:00:00 WIB",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Jam pulang: 00:00:00 s.d. 00:00:00 WIB",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 25.w,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 20.w,
                        backgroundColor: const Color(0xff5A90FF),
                        child: Icon(
                          Icons.timer_outlined,
                          size: 20.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Text(
                  "Riwawat Presensi",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    height: 130.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.white : AppColors.blueWhite,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.blueLight,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check_outlined,
                                  color: Colors.white,
                                  size: 10.w,
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.blueLight,
                              ),
                              child: Center(
                                child: Text(
                                  "hadir",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Senin",
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "05 November 2022",
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Datang : 00 : 00 : 00 WIB",
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Pulang : 00 : 00 : 00 WIB",
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
