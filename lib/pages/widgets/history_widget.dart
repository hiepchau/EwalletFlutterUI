import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import '../../style/color.dart';

class HistoryWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Color subtitleColor;
  final String time;
  final String balance;
  final String amount;
  // final Function onTap;

  const HistoryWidget(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.title,
      required this.subtitle,
      required this.time,
      required this.balance,
      required this.amount,
      this.subtitleColor = black})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.01),
              spreadRadius: 5,
              blurRadius: 10,
              // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: Icon(
                          icon,
                          color: iconColor,
                          size: 55,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18, fontFamily: 'SVN-Gotham'),
                          ),
                          Text(
                            time,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color.fromARGB(125, 0, 0, 0),
                                fontSize: 13,
                                fontFamily: 'SVN-Gotham'),
                          ),
                          Text(
                            balance,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color.fromARGB(125, 0, 0, 0),
                                fontSize: 13,
                                fontFamily: 'SVN-Gotham'),
                          )
                        ])
                  ],
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            amount,
                            style: TextStyle(
                                fontSize: 15,
                                color: subtitleColor,
                                fontFamily: 'SVN-Gotham'),
                          ),
                          const Text(
                            "Thành công",
                            style: TextStyle(                            
                                fontSize: 15,
                                color: Colors.green,
                                fontFamily: 'SVN-Gotham'),
                          )
                        ])),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: grey,
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
