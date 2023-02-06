import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ewallet/pages/account_page.dart';
import 'package:ewallet/pages/dashboard_page.dart';
import 'package:ewallet/pages/history_page.dart';
import 'package:ewallet/pages/qr_page.dart';
import 'package:ewallet/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  int pageIndex = 0;
  GlobalKey key = GlobalKey();
  late final tabController = TabController(length: 5, vsync: this);

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getTabs(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            selectedTab(4);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const QRScreen()));
          });
        },
        backgroundColor: secondary,
        child: Image.asset(
          'assets/images/icons/qrcode.gif',
          height: 30,
          width: 30,
          
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: getBody(),
    );
  }

  Widget getTabs() {
    List<IconData> iconsItems = [
      MaterialCommunityIcons.home,
      MaterialCommunityIcons.history,
      MaterialCommunityIcons.wallet,
      MaterialCommunityIcons.account,
    ];
    return AnimatedBottomNavigationBar(
      key: key,
      activeColor: secondary,
      splashColor: secondary,
      inactiveColor: grey,
      icons: iconsItems,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      activeIndex: pageIndex,
      onTap: (index) {
        setState(() {
          selectedTab(index);
        });
      },
    );
  }

  Widget getBody() {
    return TabBarView(
      controller: tabController,
      children: [
        Dashboard(),
        HistoryPage(),
        Center(child: Text("Wallet")),
        AccountPage(),
        QRScreen(),
      ],
    );
  }

  selectedTab(index) {
    setState(() {
      if (pageIndex != index) {
        tabController.index = index;
        pageIndex = index;
      }
    });
  }
}
