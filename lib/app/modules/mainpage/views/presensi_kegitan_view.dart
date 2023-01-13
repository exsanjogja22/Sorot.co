import 'package:aplikasi_menejement/app/modules/mainpage/views/mainpage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/app_colors.dart';
import '../../../data/models/presensi_kegiatan_model.dart';
import '../../../modules/mainpage/controllers/mainpage_controller.dart';

class PresensiKegitanView extends StatelessWidget {
  const PresensiKegitanView(this.controller, {Key? key}) : super(key: key);
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
                  "Daftar Presensi Kegiatan".toTitleCase(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder<PresensiKegiatan?>(
              future: controller.initPresensiKegiatan,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data!.data![index];
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            height: 85.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                topRight: Radius.circular(15.r),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 70.h,
                                  width: 70.w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 20.h),
                                  decoration: BoxDecoration(
                                      color: AppColors.blueWhite,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Image.asset(
                                    "assets/icons/menu_presensi/tanggal.png",
                                    color: AppColors.blueDrak,
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
                                          Text(
                                            data.mkTitle!.toTitleCase(),
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              data.mkDescription!,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff5E5E5E),
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffC9DDFF),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                          children: List.generate(
                                        data.labelHari!.length,
                                        (index) => Text(
                                          "${data.labelHari![index]}, ",
                                          style: GoogleFonts.poppins(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.blueDrak,
                                          ),
                                        ),
                                      )),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_alarms_outlined,
                                            color: const Color(0xff6C99F6),
                                            size: 20.w,
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Text(
                                            "${data.waktuPresensi!} WIB",
                                            style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff5E5E5E)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.blueLight,
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Container(
                                      height: 30.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Presensi",
                                          style: GoogleFonts.poppins(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
