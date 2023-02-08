import 'package:flutter/material.dart';
import '../../style/color.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.balance,
    required this.amount,
  });
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;
  final String balance;
  final String amount;
  static bool isObscure = true;
  @override
  _HistoryWidget createState() => _HistoryWidget();
}

class _HistoryWidget extends State<HistoryWidget> {
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
                      width: kIsWeb ? 50 : 30,
                      height: 50,
                      child: Center(
                        child: Icon(
                          widget.icon,
                          color: widget.iconColor,
                          size: kIsWeb ? 55 : 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: kIsWeb ? 50 : 30,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: kIsWeb ? 18 : 16,
                                fontFamily: 'SVN-Gotham',
                                color: primary
                                ),
                          ),
                          Text(
                            widget.time,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color.fromARGB(125, 0, 0, 0),
                                fontSize: kIsWeb ? 13 : 12,
                                fontFamily: 'SVN-Gotham'),
                          ),
                          Text(
                            HistoryWidget.isObscure
                                ? "Số dư ví: ******"
                                : "Số dư ví: " + widget.balance,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color.fromARGB(125, 0, 0, 0),
                                fontSize: kIsWeb ? 13 : 12,
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
                            widget.amount,
                            style: TextStyle(
                                fontSize: kIsWeb ? 18 : 15,
                                fontFamily: 'SVN-Gotham',
                                color: primary),
                          ),
                          const Text(
                            "Thành công",
                            style: TextStyle(
                                fontSize: kIsWeb ? 15 : 13,
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
