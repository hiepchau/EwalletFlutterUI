import 'package:ewallet/pages/notification_page.dart';
import 'package:ewallet/pages/widgets/ad_mini_panel.dart';
import 'package:ewallet/pages/widgets/icon_label.dart';
import 'package:ewallet/pages/widgets/promo_item.dart';
import 'package:ewallet/pages/widgets/shortcut_icon.dart';
import 'package:ewallet/pages/widgets/shortcut_panel.dart';
import 'package:ewallet/utils/list_utils.dart';
import 'package:ewallet/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.lightBlue),
        ),
        Column(
          children: [
            Expanded(
                flex: 53,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;

                    final iconWidth = width * 25 / 390;
                    final contentWidth = width * 100 / 390;

                    final fontSize = 10.0;

                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          decorateFlexButton(iconWidth, fontSize, contentWidth,
                              Icons.notification_add, '100.000đ', Colors.green),
                          decorateFlexButton(iconWidth, fontSize, contentWidth,
                              Icons.ac_unit, 'Quà của tôi', Colors.cyanAccent)
                        ]);
                  },
                )),
            Expanded(
                flex: 670,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final height = constraints.maxHeight;

                    final promoItemWidth = width * 150 / 390;
                    final buttonHeight = height * 28 / 720;

                    final promoRows = WidgetUtils.rowEvenlyWidthDivideWrap(
                            width,
                            promoItemWidth,
                            2,
                            List.generate(
                                4,
                                (index) => SizedBox(
                                    width: promoItemWidth, child: PromoItem())))
                        .map((e) => Row(children: e))
                        .toList();

                    final hotPromoRows = WidgetUtils.rowEvenlyWidthDivideWrap(
                            width,
                            promoItemWidth,
                            2,
                            List.generate(
                                4,
                                (index) => SizedBox(
                                    width: promoItemWidth, child: PromoItem())))
                        .map((e) => Row(children: e))
                        .toList();

                    return ListView(
                      shrinkWrap: false,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.fire_hydrant_alt_rounded,
                            ),
                            Text('Deal \'hời\' chỉ từ 2 xu'),
                          ],
                        ),
                        Column(
                            children: ListUtils.join(
                                promoRows, (_) => const SizedBox(height: 10))),
                        Text('Khám phá quà mới'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildRoundButton(buttonHeight, 'Tất cả', () {}),
                            buildRoundButton(buttonHeight, 'Mua sắm', () {}),
                            buildRoundButton(buttonHeight, 'Điện thoại', () {}),
                          ],
                        ),
                        Column(
                            children: ListUtils.join(hotPromoRows,
                                (_) => const SizedBox(height: 10))),
                      ],
                    );
                  },
                )),
          ],
        )
      ],
    ));
  }

  Widget buildRoundButton(
      double suggestIconHeight, String text, void Function()? onTap) {
    return Container(
      height: suggestIconHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Center(
          child: TextButton(
            onPressed: onTap,
            child: Text(text, style: const TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }

  Widget decorateFlexButton(double iconWidth, double fontSize,
      double contentWidth, IconData icon, String text, Color color) {
    return buildFlexButton(
        Icon(icon),
        iconWidth,
        Container(
            height: iconWidth * 1.2,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: color),
            child: Center(
              child: Text(text, style: TextStyle(fontSize: fontSize)),
            )),
        contentWidth);
  }

  Widget buildFlexButton(
      Widget flex, double flexWidth, Widget content, double contentWidth) {
    double flexOver = flexWidth * 0.5;
    double flexRemain = flexWidth - flexOver;
    return SizedBox(
      width: flexRemain + contentWidth,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: flexRemain),
              child: SizedBox(
                width: contentWidth,
                child: content,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: flexWidth,
              child: flex,
            ),
          ),
        ],
      ),
    );
  }
}
