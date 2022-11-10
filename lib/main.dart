import 'package:ewallet/root_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.lightBlueAccent,
      accentColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
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
    home: RootApp(),
  ));
}