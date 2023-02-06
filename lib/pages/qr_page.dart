// ignore_for_file: library_private_types_in_public_api

import 'package:ewallet/pages/widgets/qr_screen/qr_generate.dart';
import 'package:ewallet/pages/widgets/qr_screen/qr_scanner.dart';
import 'package:ewallet/style/color.dart';
import 'package:flutter/material.dart';

import '../style/constants.dart';

class QRScreen extends StatefulWidget {
  static String id = 'qr_screen';

  const QRScreen({Key? key}) : super(key: key);

  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 0,
          title: Text('QR Code'),
          backgroundColor: primary,
          shadowColor: Colors.black54,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: Colors.lightBlue,
            tabs: [
              Tab(
                child: Text(
                  'Scan',
                  style: wTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  'Generate',
                  style: wTextStyle.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            QRScanner(),
            GenerateQRScreen(),
          ],
        ),
      ),
    );
  }
}
