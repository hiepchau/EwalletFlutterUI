import 'package:ewallet/pages/widgets/icon_label.dart';
import 'package:flutter/material.dart';

class ShortcutPanel extends StatelessWidget {
  const ShortcutPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: double.infinity,
        height: 200,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxHeight,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: constraints.maxHeight * 0.3,
                    child: Center(
                      child: Stack(
                        children: [
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("31.198đ"))),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.currency_exchange),
                                        Text("0 xu"),
                                        Icon(Icons.arrow_forward_ios_rounded)
                                      ]))),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: Colors.grey))
                        ],
                      ),
                    ),
                  ),
                  Container(
                      color: Colors.white,
                      height: constraints.maxHeight * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          IconLabel(
                              label: "Chuyển tiền", icon: Icons.access_alarm),
                          IconLabel(
                              label: "Mã thanh toán", icon: Icons.ac_unit),
                          IconLabel(label: "Nạp/Rút", icon: Icons.accessible),
                          IconLabel(label: "Ưu đãi", icon: Icons.back_hand),
                        ],
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
