import 'package:ewallet/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class HistoryPage extends StatelessWidget{
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: primary,
      ),
      body: getBody(),
    );
  }

  Widget getBody(){
    return Container();
  }

}