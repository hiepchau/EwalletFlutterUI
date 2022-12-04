import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import '../../style/color.dart';

class HistoryWidget extends StatelessWidget{
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Color subtitleColor;
  // final Function onTap;

  const HistoryWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.subtitleColor = black}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        width: double.infinity,
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Icon(
                              icon,
                              color: iconColor,
                              size: 50,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children:[
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'SVN-Gotham'
                          ),
                        )
                        ])
                      ],
                    ),
                    Expanded(child: Text(
                      subtitle,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 15,
                          color: subtitleColor,
                          fontFamily: 'SVN-Gotham'),
                    ),),

                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: grey,
                    )
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
