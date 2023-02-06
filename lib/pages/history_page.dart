// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:ewallet/history_lists.dart';
import 'package:ewallet/pages/widgets/history_widget.dart';
import 'package:ewallet/style/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ewallet/style/color.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 130,
            automaticallyImplyLeading: false,
            title: getAppBar(context),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(35),
              child: getTabBar(),
            ),
          ),
          body: getBody(),
        ));
  }

  Widget getTabBar() {
    return Container(
        height: 48,
        decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10), right: Radius.circular(10))
            //border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
            ),
        child: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.black.withOpacity(0.3),
            indicator:  UnderlineTabIndicator(
                borderSide: BorderSide(width: 2, color: primary)),
            indicatorColor: primary,
            labelColor: primary,
            tabs: const [
              Text("Tất cả",),
              Text("Nạp tiền"),
              Text("Chuyển tiền"),
              Text("Nhận tiền"),
              Text("Điện thoại"),
              Text("Rút tiền"),
            ]));
  }

  Widget getAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 125,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        const Text("Lịch sử"),
        const SizedBox(height: 10),
        ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: kIsWeb
                    ? MediaQuery.of(context).size.width / 2
                    : MediaQuery.of(context).size.width),
            child: Row(children: [
              Expanded(
                  child: TextFormField(
                decoration: InputDecoration(
                  focusColor: ColorScheme.fromSeed(seedColor: Colors.blue).primary,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  hintText: "Tìm kiếm",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              )),
              const SizedBox(
                width: 20,
              ),
              Column(children: [
                GestureDetector(
                  onTap: _toggleVisibility,
                  child: Icon(
                    obscureText
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    size: 15.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  obscureText ? "Hiện số dư" : "Ẩn số dư",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                )
              ])
            ]))
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

  Widget everythingHistoryScreen() {
    List<Widget> listWidget = List<Widget>.empty(growable: true);
    historyList.sort(((a, b) {
      DateTime dateA = DateTime.parse(a["time"]);
      DateTime dateB = DateTime.parse(b["time"]);
      return dateB.compareTo(dateA);
    }));
    int temp = 0;
    for (Map element in historyList) {
      if (DateTime.parse(element["time"]).month != temp) {
        temp = DateTime.parse(element["time"]).month;
        listWidget.add(Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Tháng $temp",
              style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'SVN-Gotham',
                  fontWeight: FontWeight.w700),
            )));
      }
      if (element["type"] == "receive") {
        listWidget.add(HistoryWidget(
            icon: Icons.arrow_downward_rounded,
            iconColor: Colors.green,
            title: "Nhận tiền",
            subtitle: "Nhận tiền từ " + element["from"],
            time: element["time"],
            balance: element["balance"],
            amount: "+" + element["amount"]));
      }
      if (element["type"] == "transfer") {
        listWidget.add(HistoryWidget(
            icon: FontAwesomeIcons.moneyBillTransfer,
            iconColor: Colors.green,
            title: "Chuyển tiền",
            subtitle: "Chuyển tiền đến " + element["to"],
            time: element["time"],
            balance: element["balance"],
            amount: "-" + element["amount"]));
      }
      if (element["type"] == "withdraw") {
        listWidget.add(HistoryWidget(
            icon: Icons.account_balance_wallet_rounded,
            iconColor: Colors.redAccent,
            title: "Rút tiền",
            subtitle: "Rút tiền về " + element["to"],
            time: element["time"],
            balance: element["balance"],
            amount: "-" + element["amount"]));
      }
      if (element["type"] == "phone") {
        listWidget.add(HistoryWidget(
            icon: Icons.phone_android,
            iconColor: Colors.blueAccent,
            title: "Nạp tiền điện thoại",
            subtitle: "Nạp cho số " + element["to"],
            time: element["time"],
            balance: element["balance"],
            amount: "-" + element["amount"]));
      }
      if (element["type"] == "deposit") {
        listWidget.add(HistoryWidget(
            icon: Icons.monetization_on_outlined,
            iconColor: Colors.green,
            title: "Nạp tiền",
            subtitle: "Nạp tiền từ " + element["from"],
            time: element["time"],
            balance: element["balance"],
            amount: "+" + element["balance"]));
      }
    }
    return ListView(
      padding: const EdgeInsets.all(5),
      children: listWidget,
    );
  }

  Widget depositHistoryScreen() {
    List<Widget> listWidget = List<Widget>.empty(growable: true);
    for (Map element in historyList) {
      if (element["type"] == "deposit") {
        listWidget.add(HistoryWidget(
          icon: Icons.monetization_on_outlined,
          iconColor: Colors.green,
          title: "Nạp tiền",
          subtitle: "Nạp tiền từ " + element["from"],
          time: element["time"],
          balance: element["balance"],
          amount: "+" + element["balance"],
        ));
      }
    }
    return ListView(
      padding: const EdgeInsets.all(5),
      children: listWidget,
    );
  }

  Widget transferistoryScreen() {
    List<Widget> listWidget = List<Widget>.empty(growable: true);
    for (Map element in historyList) {
      if (element["type"] == "transfer") {
        listWidget.add(HistoryWidget(
            icon: Icons.repeat_rounded,
            iconColor: Colors.green,
            title: "Chuyển tiền",
            subtitle: "Chuyển tiền đến " + element["to"],
            time: element["time"],
            balance: element["balance"],
            amount: "-" + element["amount"]));
      }
    }
    return ListView(
      padding: const EdgeInsets.all(5),
      children: listWidget,
    );
  }

  Widget receiveHistoryScreen() {
    List<Widget> listWidget = List<Widget>.empty(growable: true);
    for (Map element in historyList) {
      if (element["type"] == "receive") {
        listWidget.add(HistoryWidget(
            icon: Icons.arrow_downward_rounded,
            iconColor: Colors.green,
            title: "Nhận tiền",
            subtitle: "Nhận tiền từ " + element["from"],
            time: element["time"],
            balance: element["balance"],
            amount: "+" + element["amount"]));
      }
    }
    return ListView(
      padding: const EdgeInsets.all(5),
      children: listWidget,
    );
  }

  Widget mobileHistoryScreen() {
    List<Widget> listWidget = List<Widget>.empty(growable: true);
    for (Map element in historyList) {
      if (element["type"] == "phone") {
        listWidget.add(HistoryWidget(
            icon: Icons.phone_android,
            iconColor: Colors.blueAccent,
            title: "Nạp tiền điện thoại",
            subtitle: "Nạp cho số " + element["to"],
            time: element["time"],
            balance: element["balance"],
            amount: "-" + element["amount"]));
      }
    }
    return ListView(
      padding: const EdgeInsets.all(5),
      children: listWidget,
    );
  }

  Widget withdrawHistoryScreen() {
    List<Widget> listWidget = List<Widget>.empty(growable: true);
    for (Map element in historyList) {
      if (element["type"] == "withdraw") {
        listWidget.add(HistoryWidget(
            icon: Icons.account_balance_wallet_rounded,
            iconColor: Colors.redAccent,
            title: "Rút tiền",
            subtitle: "Rút tiền về " + element["to"],
            time: element["time"],
            balance: element["balance"],
            amount: "-" + element["amount"]));
      }
    }
    return ListView(
      padding: const EdgeInsets.all(5),
      children: listWidget,
    );
  }

  void _toggleVisibility() {
    setState(() {
      obscureText = !obscureText;
      HistoryWidget.isObscure = obscureText;
    });
  }
}
