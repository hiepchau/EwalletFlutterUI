import 'dart:math';

import 'package:ewallet/style/color.dart';
import 'package:ewallet/style/constants.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class GenerateQRScreen extends StatefulWidget {
  const GenerateQRScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GenerateQRPageState createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends State<GenerateQRScreen> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
  TextEditingController controller = TextEditingController();
  String data = "123123";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2))
                ]),
            child: Column(children: [
              const Text(
                "Đưa mã này cho thu ngân để thanh toán",
                style: wBoldTitleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: data,
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 20,
              ),
              BarcodeWidget(
                barcode: Barcode.code128(),
                data: data,
                width: 300,
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Tự động cập nhật sau ",
                    style: wBlackTextStyle,
                  ),
                  CountdownTimer(
                    endTime: endTime,
                    onEnd: () {
                      setState(() {
                        endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
                        data = Random().nextInt(100000).toString();
                      });
                    },
                    textStyle: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: white,
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2)),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 45,
                      height: 45,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/icons/vietcombankIcon.png"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text("Nguồn tiền thanh toán",
                              style: wBoldTitleStyle),
                          Row(
                            children: const [
                              Text(
                                "Số dư: ",
                                style: wBlackTextStyle,
                              ),
                              Text(
                                "2.000.000",
                                style: wBlackTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Thay đổi",
                      style: wBlueTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
