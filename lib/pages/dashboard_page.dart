import 'package:ewallet/pages/widgets/ad_mini_panel.dart';
import 'package:ewallet/pages/widgets/icon_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.amber,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.red,
                  ),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 4),
                    children: const [
                      IconLabel(label: "Nạp tiền ĐT", icon: Icons.abc_outlined),
                      IconLabel(
                          label: "Thanh toán hóa đơn",
                          icon: Icons.access_alarm_rounded),
                      IconLabel(
                          label: "Nhận tiền", icon: Icons.add_box_rounded),
                      IconLabel(
                          label: "Tài khoản tích lũy", icon: Icons.add_circle),
                      IconLabel(label: "Nạp 3G/4G", icon: Icons.access_alarm),
                      IconLabel(label: "VETC", icon: Icons.atm),
                      IconLabel(label: "Đặt vé phim", icon: Icons.add_to_queue),
                      IconLabel(label: "Tất cả", icon: Icons.add_to_queue),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 100,
                          color: Colors.green,
                        ),
                        Container(
                          width: 100,
                          color: Colors.purple,
                        ),
                        Container(
                          width: 100,
                          color: Colors.pink,
                        ),
                        Container(
                          width: 100,
                          color: Colors.orange,
                        ),
                        Container(
                          width: 100,
                          color: Colors.white,
                        ),
                        Container(
                          width: 100,
                          color: Colors.pink,
                        ),
                        Container(
                          width: 100,
                          color: Colors.purple,
                        ),
                        Container(
                          width: 100,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 200,
                      child: ListView.separated(
                        itemBuilder: (context, index) => const AdMiniPanel(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                      )),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.pink,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.brown,
                  ),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 4),
                    children: const [
                      IconLabel(label: "Lazada", icon: Icons.abc_outlined),
                      IconLabel(
                          label: "BAEMIN", icon: Icons.access_alarm_rounded),
                      IconLabel(label: "be", icon: Icons.add_box_rounded),
                      IconLabel(
                          label: "Thanh toán Google Play",
                          icon: Icons.add_circle),
                      IconLabel(label: "Tiki", icon: Icons.access_alarm),
                      IconLabel(label: "Circle K", icon: Icons.atm),
                      IconLabel(label: "7-Eleven", icon: Icons.add_to_queue),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.white,
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
