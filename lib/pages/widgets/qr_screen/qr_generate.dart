import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRScreen extends StatefulWidget {
  @override
  _GenerateQRPageState createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends State<GenerateQRScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImage(
            data: controller.text,
            size: 300,
            embeddedImage: AssetImage('images/login_logo.jgp'),
            embeddedImageStyle: QrEmbeddedImageStyle(size: Size(80, 80)),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter URL'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('GENERATE QR')),
        ],
      ),
    );
  }
}
