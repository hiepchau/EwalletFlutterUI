import 'package:ewallet/pages/widgets/icon_label.dart';
import 'package:flutter/material.dart';

class _ShortcutIcon extends StatelessWidget {
  final IconData iconData;
  final String text;

  const _ShortcutIcon(this.iconData, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth > 50 ? constraints.maxWidth : 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 15,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(iconData),
              ),
              const SizedBox(height: 5),
              Flexible(
                  child: Text(
                text,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        );
      },
    );
  }
}

class ShortcutPanel extends StatelessWidget {
  const ShortcutPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconWidth = 50.0;
    return AspectRatio(
      aspectRatio: 70 / 23,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          SizedBox(
              width: iconWidth,
              child: _ShortcutIcon(Icons.swap_horiz, 'Nạp tiền')),
          SizedBox(
              width: iconWidth, child: _ShortcutIcon(Icons.wallet, 'Rút tiền')),
          SizedBox(
              width: iconWidth, child: _ShortcutIcon(Icons.qr_code, 'QR Pay')),
          SizedBox(
              width: iconWidth,
              child: _ShortcutIcon(Icons.qr_code, 'Mã thanh toán')),
        ],
      ),
    );
  }
}
