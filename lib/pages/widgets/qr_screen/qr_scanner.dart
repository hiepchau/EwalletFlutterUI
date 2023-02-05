import 'dart:async';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  String _scanResult = "";

  Future _scanQR() async {
    try {
      String qrResult = (await BarcodeScanner.scan()).rawContent;
      setState(() {
        _scanResult = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          _scanResult = "Camera permission was denied";
        });
      } else {
        setState(() {
          _scanResult = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        _scanResult = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        _scanResult = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: _scanQR,
              child: const Text("Scan QR code"),
            ),
            Text(_scanResult),
          ],
        ),
      ),
    );
  }
}
