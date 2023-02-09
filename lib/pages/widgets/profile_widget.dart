import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import '../../style/color.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Color subtitleColor;
  final Color color;
  // final Function onTap;

  const ProfileWidget(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.title,
      required this.subtitle,
      this.color = white,
      this.subtitleColor = black})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (_) => CardPage()));
        // onTap();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
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
                    Container(
                      width: MediaQuery.of(context).size.width > 350 ? 40 : 20,
                      height: MediaQuery.of(context).size.width > 350 ? 40 : 20,
                      child: Center(
                        child: Icon(
                          icon,
                          color: iconColor,
                          size: MediaQuery.of(context).size.width > 350
                              ? 30
                              : 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width > 350 ? 10 : 25,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 900
                              ? 15
                              : MediaQuery.of(context).size.width > 350
                                  ? 15
                                  : 13,
                          fontFamily: 'SVN-Gotham'),
                    )
                  ],
                ),
                Expanded(
                  child: Text(
                    subtitle,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width > 900
                            ? 15
                            : MediaQuery.of(context).size.width > 350
                                ? 15
                                : 13,
                        color: subtitleColor,
                        fontFamily: 'SVN-Gotham'),
                  ),
                ),
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
