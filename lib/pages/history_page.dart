import 'package:ewallet/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class HistoryPage extends StatelessWidget{
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        title: getAppBar(),
        bottom: PreferredSize(child: getTabBar(), preferredSize: Size.fromHeight(35),),
      ),
      body: getBody(),
    ));
  }

  Widget getTabBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(color: white,
      border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.black.withOpacity(0.3),
      indicator: UnderlineTabIndicator(borderSide:BorderSide(width: 2, color: Colors.blue)),
      indicatorColor: Colors.blue,
      labelColor: Colors.blue,
      tabs: [
      Text("Tat ca"),
      Text("Nap tien"),
      Text("Chuyen tien"),
      Text("Nhan tien"),
      Text("Dien thoai"),
      Text("Rut tien"),
    ]));
  }

  Widget getAppBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      child: Column(children: [
        const Text("History"),
        const SizedBox(height: 10),
        Expanded(
            child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            hintText: "Tim kiem",
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ))
      ]),
    );
  }

  Widget getBody() {
    return TabBarView(children: [
      everythingHistoryScreen(),
      depositHistoryScreen(),
      transferistoryScreen(),
      receiveHistoryScreen(),
      mobileHistoryScreen(),
      withdrawHistoryScreen(),
    ]);
  }

  Widget everythingHistoryScreen(){
    return Container(child: Text("Tat ca"),);
  }
  Widget depositHistoryScreen(){
    return Container(child: Text("Nap tien"),);
  }
  Widget transferistoryScreen(){
    return Container(child: Text("Chuyen tien"),);
  }
  Widget receiveHistoryScreen(){
    return Container(child: Text("Nhan tien"),);
  }
  Widget mobileHistoryScreen(){
    return Container(child: Text("Dien thoai"),);
  }
  Widget withdrawHistoryScreen(){
    return Container(child: Text("Rut tien"),);
  }
}
