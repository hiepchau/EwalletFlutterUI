import 'dart:math';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ewallet/app_navigator.dart';
import 'package:ewallet/pages/account_page.dart';
import 'package:ewallet/pages/dashboard_page.dart';
import 'package:ewallet/pages/history_page.dart';
import 'package:ewallet/pages/payment_success_screen.dart';
import 'package:ewallet/pages/promo_page.dart';
import 'package:ewallet/pages/qr_page.dart';
import 'package:ewallet/style/color.dart';
import 'package:ewallet/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class RootWebApp extends StatefulWidget {
  const RootWebApp({Key? key}) : super(key: key);

  @override
  State<RootWebApp> createState() => _RootWebAppState();
}

class _WalletData {
  final Object display;
  final String title;
  final String value;

  _WalletData(this.display, this.title, this.value);

  Widget toWidget(double? size) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              WidgetUtils.toIconDisplay(display, size),
              Text(title),
            ],
          ),
          Text('$valueđ')
        ]);
  }
}

class _RootWebAppState extends State<RootWebApp> with TickerProviderStateMixin {
  late final tabController = TabController(length: 5, vsync: this);
  bool _walletExpanded = true;
  bool _walledShowAll = false;
  final _defWalletShow = 3;

  final List<_WalletData> _walletData = [
    _WalletData(Icon(Icons.account_balance_wallet), 'Ví', '100.000.000'),
    _WalletData(Icon(Icons.abc_outlined), 'TPBank', '100.000.000'),
    _WalletData(Icon(Icons.access_alarm_sharp), 'Vietcombank', '100.000.000'),
    _WalletData(Icon(Icons.add_chart_rounded), 'Argibank', '100.000.000'),
    _WalletData(Icon(Icons.wallet_giftcard), 'MBBank', '100.000.000'),
    _WalletData(Icon(Icons.notification_add_sharp), 'OCB', '100.000.000'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 790,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.greenAccent),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        createTabButton('Dashboard', 0),
                        createTabButton('Chuyển và nhận tiền', 1),
                        createTabButton('Ví', 2),
                        createTabButton('Lịch sử', 3),
                        createTabButton('Trợ giúp', 4),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1280 - 790,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Icon(Icons.notifications_active_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(Icons.settings),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: createTextButton('Đăng xuất', () {
                            AppNav.push(context, PaymentSuccessScreen());
                          }),
                        )
                      ],
                    ),
                  )),
            ],
          )),
      body: Container(
        decoration: const BoxDecoration(color: Colors.grey),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 790,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.greenAccent),
                  child: Navigator(
                    key: AppNav.getWebNavKey(),
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                          builder: (_) => TabBarView(
                                controller: tabController,
                                children: [
                                  Dashboard(),
                                  HistoryPage(),
                                  PromoPage(),
                                  AccountPage(),
                                  QRScreen(),
                                ],
                              ),
                          settings: settings);
                    },
                  ),
                )),
            Expanded(
                flex: 1280 - 790,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 40, bottom: 40),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                                ExpansionPanelList(
                                  expansionCallback: (index, isExpanded) {
                                    setState(() {
                                      _walletExpanded = !_walletExpanded;
                                    });
                                  },
                                  children: [
                                    ExpansionPanel(
                                      headerBuilder: (context, isExpanded) {
                                        return ListTile(
                                          title: Text('Tài khoản/Thẻ'),
                                        );
                                      },
                                      body: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              border: Border(
                                                top: BorderSide(
                                                    width: 5.0,
                                                    color: Colors
                                                        .lightBlue.shade600),
                                                bottom: BorderSide(
                                                    width: 5.0,
                                                    color: Colors
                                                        .lightBlue.shade900),
                                              )),
                                          child: Column(
                                            children: _walletData
                                                .sublist(
                                                    0,
                                                    _walledShowAll
                                                        ? _walletData.length
                                                        : min(_walletData.length,
                                                            _defWalletShow))
                                                .map((e) => e.toWidget(null))
                                                .toList(),
                                          )),
                                      isExpanded: _walletExpanded,
                                    ),
                                  ],
                                )
                              ] +
                              (_walledShowAll
                                  ? []
                                  : [
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _walledShowAll = true;
                                            });
                                          },
                                          child: Text(
                                              'Xem tất cả (${_walletData.length - _defWalletShow})'))
                                    ]) +
                              [
                                createNavButton(Icons.newspaper,
                                    'Quản lý thanh toán', () {}, null),
                                createNavButton(
                                    Icons.new_releases, 'Bảo mật', () {}, null),
                              ],
                        ),
                      )),
                )),
          ],
        ),
      ),
    );
  }

  Widget createNavButton(
      Object display, String title, void Function()? onTap, double? size) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                WidgetUtils.toIconDisplay(display, size),
                Text(title),
              ],
            ),
            Icon(Icons.arrow_forward_ios)
          ]),
    );
  }

  Widget createTabButton(String text, int tabIndex) {
    return createTextButton(text, () {
      selectedTab(tabIndex);
    });
  }

  Widget createTextButton(String text, void Function() onTap) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }

  selectedTab(index) {
    setState(() {
      tabController.index = index;
    });
  }
}
