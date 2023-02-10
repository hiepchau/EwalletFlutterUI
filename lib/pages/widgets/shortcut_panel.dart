import 'dart:math';

import 'package:ewallet/pages/payment_screen.dart';
import 'package:ewallet/pages/qr_page.dart';
import 'package:ewallet/pages/widgets/icon_label.dart';
import 'package:ewallet/pages/widgets/shortcut_icon.dart';
import 'package:ewallet/style/color.dart';
import 'package:ewallet/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShortcutPanel extends StatefulWidget {
  const ShortcutPanel({Key? key}) : super(key: key);

  @override
  _ShortcutPanel createState() => _ShortcutPanel();
}

class _ShortcutPanel extends State<ShortcutPanel> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    const iconWidth = 40.0;
    return AspectRatio(
      aspectRatio: 70 / 40,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              var width = constraints.maxWidth;
              var maxWidth = iconWidth * 1.5;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2)),
                            ],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hoverColor: primaryContainer,
                              focusColor: primary,
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.search, color: primary,),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              hintText: "Tìm kiếm",
                              hintStyle: TextStyle(color: primary),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          )),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2)),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                isVisible
                                    ? "Số dư ví: 900.000.000đ"
                                    : "Số dư ví: ************",
                                    style: TextStyle(
                                      color: primary
                                    ),
                              ),
                              GestureDetector(
                                onTap: (() => setState(() {
                                      isVisible = !isVisible;
                                    })),
                                child: Icon(
                                  isVisible
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 20,
                                  color: primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShortcutIcon(
                          Icon(
                            Icons.swap_horiz,
                            color: primary,
                          ),
                          'Chuyển khoản',
                          iconWidth,
                          maxWidth,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    settings: RouteSettings(name: "/root_page"),
                                    builder: (context) => PaymentScreen()));
                          },
                        ),
                        ShortcutIcon(
                            Icon(
                              Icons.wallet,
                              color: primary,
                            ),
                            'Rút tiền',
                            iconWidth,
                            maxWidth),
                        ShortcutIcon(
                          ImageIcon(
                            AssetImage('assets/images/icons/scannerIcon.png'),
                            color: primary,
                          ),
                          'QR Pay',
                          iconWidth,
                          maxWidth,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const QRScreen('QRCODE')));
                          },
                        ),
                        ShortcutIcon(
                          Icon(
                            Icons.qr_code,
                            color: primary,
                          ),
                          'Mã thanh toán',
                          iconWidth,
                          maxWidth,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const QRScreen('QRSCANNER')));
                          },
                        ),
                      ],          
                             
                    ),
                    SizedBox(
                      height: 15,
                    )  
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
