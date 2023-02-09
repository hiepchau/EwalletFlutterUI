import 'package:ewallet/pages/widgets/ad_mini_panel.dart';
import 'package:ewallet/pages/widgets/icon_label.dart';
import 'package:ewallet/pages/widgets/shortcut_icon.dart';
import 'package:ewallet/pages/widgets/shortcut_panel.dart';
import 'package:ewallet/utils/list_utils.dart';
import 'package:ewallet/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: const [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Hello, Hiep Chau')),
                Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.ac_unit))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  buildOverviewBoard(),
                  const ShortcutPanel(),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      const iconLabelWidth = 40.0;
                      const labelWidth = iconLabelWidth * 1.5;

                      List<Widget> shortcuts =
                          WidgetUtils.stackEvenlyWidthDivideWrap(
                                  width, labelWidth, 4, [
                        const ShortcutIcon(Icons.abc_outlined, 'Nạp tiền ĐT',
                            iconLabelWidth, labelWidth),
                        const ShortcutIcon(Icons.access_alarm_rounded,
                            'Thanh toán hóa đơn', iconLabelWidth, labelWidth),
                        const ShortcutIcon(Icons.add_box_rounded, 'Nhận tiền',
                            iconLabelWidth, labelWidth),
                        const ShortcutIcon(Icons.add_circle,
                            'Tài khoản tích lũy', iconLabelWidth, labelWidth),
                        const ShortcutIcon(Icons.access_alarm, 'Nạp 3G/4G',
                            iconLabelWidth, labelWidth),
                        const ShortcutIcon(
                            Icons.atm, 'VETC', iconLabelWidth, labelWidth),
                        const ShortcutIcon(Icons.add_to_queue, 'Đặt vé phim',
                            iconLabelWidth, labelWidth),
                        const ShortcutIcon(Icons.add_to_queue, 'Tất cả',
                            iconLabelWidth, labelWidth),
                      ])
                              .map((e) => Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: e,
                                  ))
                              .toList();

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: ListUtils.join(
                            shortcuts, (index) => const SizedBox(height: 10)),
                      );
                    },
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      const iconLabelWidth = 40.0;
                      const labelWidth = iconLabelWidth * 1.5;

                      List<Widget> shortcuts =
                          WidgetUtils.stackEvenlyWidthDivideWrap(
                                  width, labelWidth, 4, [
                        const ShortcutIcon(Icons.abc_outlined, 'Mua vé máy bay',
                            iconLabelWidth, labelWidth),
                        const ShortcutIcon(Icons.access_alarm_rounded, 'KFC',
                            iconLabelWidth, labelWidth),
                        const ShortcutIcon(Icons.add_box_rounded, 'Jolibee',
                            iconLabelWidth, labelWidth),
                        const ShortcutIcon(Icons.add_circle, 'Uniqlo',
                            iconLabelWidth, labelWidth),
                      ])
                              .map((e) => Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: e,
                                  ))
                              .toList();

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                              const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Đề xuất:"))
                            ] +
                            ListUtils.join(shortcuts,
                                (index) => const SizedBox(height: 10)),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AspectRatio buildOverviewBoard() {
    return AspectRatio(
      aspectRatio: 70 / 37,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  '0961248750',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: const [
                    Text(
                      '900.000.0000',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'VNĐ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.ac_unit,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.ac_unit),
                        Text('Nạp tiền'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
