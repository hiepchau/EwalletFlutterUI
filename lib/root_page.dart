import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:ewallet/pages/account_page.dart';
import 'package:ewallet/pages/dashboard_page.dart';
import 'package:ewallet/pages/history_page.dart';
import 'package:ewallet/pages/widgets/qr_screen/qr_scanner.dart';
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
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void didUpdateWidget(covariant RootApp oldWidget) {
    _startAnimation();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animationController.forward();
    super.initState();
  }

  _startAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.forward();
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
          });
        },
        backgroundColor: secondary,
        child:  Image.asset('assets/images/icons/qr.gif',
          height: 30, width: 30,),
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
    return IndexedStack(
      index: pageIndex,
      children: [
        CircularRevealAnimation(
            animation: animation,
            centerAlignment: Alignment.bottomLeft,
            child: Dashboard()),
        CircularRevealAnimation(
            animation: animation,
            centerAlignment: Alignment.bottomLeft,
            child: HistoryPage()),
        CircularRevealAnimation(
            animation: animation,
            centerAlignment: Alignment.bottomCenter,
            child: Center(child: Text("Wallet"))),
        CircularRevealAnimation(
            animation: animation,
            centerAlignment: Alignment.bottomRight,
            child: AccountPage()),
        CircularRevealAnimation(
            animation: animation,
            centerAlignment: Alignment.bottomRight,
            child: QRScanner()),
      ],
    );
  }

  selectedTab(index) {
    setState(() {
      if (pageIndex != index) {
        pageIndex = index;
        _startAnimation();
      }
    });
  }
}
