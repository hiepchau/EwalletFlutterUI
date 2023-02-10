import 'dart:math';

import 'package:ewallet/style/color.dart';
import 'package:flutter/material.dart';

class _DashedLine extends StatelessWidget {
  const _DashedLine({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.maxWidth;
        const dashWidth = 1.2;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

class PromoItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String description;
  final String price;
  final String actionTitle;

  const PromoItem(
      {Key? key,
        required this.title,
        required this.subTitle,
        required this.description,
        this.price = '',
        required this.actionTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 150 / 180,
      child: GestureDetector(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 15,
                  offset: Offset(0, 6),
                )
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final height = constraints.maxHeight;

                final decorateHeight = height * 15 / 180;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/icons/baeminIcon.png'),
                    Text(title),
                    Text(subTitle),
                    Text(description),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: decorateHeight,
                              width: decorateHeight / 2,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(100),
                                    bottomRight: Radius.circular(100),
                                  ))),
                          const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 4, right: 4),
                                child: _DashedLine(),
                              )),
                          Container(
                              height: decorateHeight,
                              width: decorateHeight / 2,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                  ))),
                        ]),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Icon(Icons.currency_exchange),
                                Text(price)
                              ],
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(actionTitle))
                        ],
                      ),
                    )
                  ],
                );
              },
            )),
      ),
    );
  }
}
