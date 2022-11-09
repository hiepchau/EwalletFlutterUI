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
            return Container(
              width: constraints.maxHeight,
              child: Column(
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight * 0.3,
                    child: Center(
                      child: Stack(
                        children: const [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("31.198đ"))),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text("0 xu"))),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: constraints.maxHeight * 0.7, //30%
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
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
        /*child: Column(
          children: [
            Stack(
              children: const [
                Text("31.198đ"),
                Text("0 xu"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: const [
                IconLabel(label: "Chuyển tiền", icon: Icons.access_alarm),
                IconLabel(label: "Mã thanh toán", icon: Icons.ac_unit),
                IconLabel(label: "Nạp/Rút", icon: Icons.accessible),
                IconLabel(label: "Ưu đãi", icon: Icons.back_hand),
              ],
            )
          ],
        ),*/
      ),
    );
  }
}
