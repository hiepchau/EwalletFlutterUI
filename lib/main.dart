import 'package:ewallet/pages/login_page.dart';
import 'package:ewallet/root_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      scaffoldBackgroundColor: ColorScheme.fromSeed(seedColor: Colors.blue).onInverseSurface,
      fontFamily: 'SVN-Gotham',
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      )
    ),
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}