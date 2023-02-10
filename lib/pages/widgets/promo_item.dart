import 'dart:math';

import 'package:ewallet/style/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2)),
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
                    Text(title,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: primary)),
                    Text(subTitle,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: primary)),
                    Text(description,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        )),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: decorateHeight,
                              width: decorateHeight / 2,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 215, 215, 215),
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
                                  color: Color.fromARGB(255, 215, 215, 215),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 10,bottom: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.coins, size: 20, color: Colors.amber,),
                                  SizedBox(width: 5,),
                                  Text(price,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, bottom: 5),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(actionTitle,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: primary))),
                          )
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