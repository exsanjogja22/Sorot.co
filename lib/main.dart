import 'package:aplikasi_menejement/app/modules/widget/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/config/app_token.dart';
import 'app/modules/login/views/login_view.dart';
import 'app/routes/app_pages.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ScreenUtilInit(
            designSize: const Size(360, 800),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return const MaterialApp(
                home: SplashScreen(),
              );
            },
            child: const SplashScreen(),
          );
        } else {
          return FutureBuilder<String?>(
            future: AppApiAuth().getToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ScreenUtilInit(
                  designSize: const Size(360, 800),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (context, child) {
                    return const MaterialApp(
                      home: SplashScreen(),
                    );
                  },
                  child: const SplashScreen(),
                );
              } else {
                return ScreenUtilInit(
                  designSize: const Size(360, 800),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (context, child) {
                    return GetMaterialApp(
                      title: "App Menejement",
                      initialRoute: snapshot.data != null
                          ? Routes.MAINPAGE
                          : Routes.LOGIN,
                      getPages: AppPages.routes,
                      theme: ThemeData(
                        textTheme: TextTheme(
                          headline5: GoogleFonts.poppins(
                            fontSize: 12.sp,
                          ),
                          headline6: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      debugShowCheckedModeBanner: false,
                    );
                  },
                  child: const LoginView(),
                );
              }
            },
          );
        }
      },
    );
  }
}
