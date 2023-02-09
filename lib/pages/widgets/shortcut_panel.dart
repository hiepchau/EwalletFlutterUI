import 'dart:math';

import 'package:ewallet/pages/payment_screen.dart';
import 'package:ewallet/pages/widgets/icon_label.dart';
import 'package:ewallet/pages/widgets/shortcut_icon.dart';
import 'package:ewallet/utils/widget_utils.dart';
import 'package:flutter/material.dart';

class ShortcutPanel extends StatelessWidget {
  const ShortcutPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconWidth = 40.0;
    return AspectRatio(
      aspectRatio: 70 / 23,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              var width = constraints.maxWidth;
              var maxWidth = iconWidth * 1.5;
              return Stack(
                children: WidgetUtils.stackEvenlyWidthDivide(width, maxWidth, [
                  ShortcutIcon(
                    Icons.swap_horiz,
                    'Chuyển khoản',
                    iconWidth,
                    maxWidth,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen()));
                    },
                  ),
                  ShortcutIcon(Icons.wallet, 'Rút tiền', iconWidth, maxWidth),
                  ShortcutIcon(Icons.qr_code, 'QR Pay', iconWidth, maxWidth),
                  ShortcutIcon(
                      Icons.qr_code, 'Mã thanh toán', iconWidth, maxWidth),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
