import 'package:ewallet/app_navigator.dart';
import 'package:ewallet/pages/login_page.dart';
import 'package:ewallet/root_page.dart';
import 'package:ewallet/root_web_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  AppNav.init();
  runApp(ScreenUtilInit(
      designSize: kIsWeb ? const Size(790, 620) : const Size(390, 800),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'SVN-Gotham',
              textTheme: const TextTheme(
                headlineSmall: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )),
          debugShowCheckedModeBanner: false,
          home: child, //TODO: change back to login page
        );
      },
      child: kIsWeb ? const RootWebApp() : const LoginPage()));
}
