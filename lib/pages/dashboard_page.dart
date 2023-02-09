import 'package:ewallet/pages/notification_page.dart';
import 'package:ewallet/pages/widgets/ad_mini_panel.dart';
import 'package:ewallet/pages/widgets/icon_label.dart';
import 'package:ewallet/pages/widgets/shortcut_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Hello, Hiep Chau')),
                Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationPage()),
                            )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '0961248750',
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      children: const [
                        Text(
                          '900.000.0000',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'VNĐ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.ac_unit,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.ac_unit),
                          Text('Nạp tiền'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ShortcutPanel(),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("ZaloPay đề xuất")),
            ),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 4),
              children: const [
                IconLabel(label: "Nạp tiền ĐT", icon: Icons.abc_outlined),
                IconLabel(
                    label: "Thanh toán hóa đơn",
                    icon: Icons.access_alarm_rounded),
                IconLabel(label: "Nhận tiền", icon: Icons.add_box_rounded),
                IconLabel(label: "Tài khoản tích lũy", icon: Icons.add_circle),
                IconLabel(label: "Nạp 3G/4G", icon: Icons.access_alarm),
                IconLabel(label: "VETC", icon: Icons.atm),
                IconLabel(label: "Đặt vé phim", icon: Icons.add_to_queue),
                IconLabel(label: "Tất cả", icon: Icons.add_to_queue),
              ],
            ),
          ],
        ),
        /*child: Stack(alignment: Alignment.topCenter, children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.amber,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
                      child: ShortcutPanel(),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("ZaloPay đề xuất")),
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: const [
                          IconLabel(
                              label: "Mua thẻ ĐT", icon: Icons.abc_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          IconLabel(
                              label: "Giới thiệu nhận quà",
                              icon: Icons.access_alarm_rounded),
                          SizedBox(
                            width: 20,
                          ),
                          IconLabel(
                              label: "1K Kỳ Diệu", icon: Icons.add_box_rounded),
                          SizedBox(
                            width: 20,
                          ),
                          IconLabel(
                              label: "Mua sắm Ẩm thực", icon: Icons.add_circle),
                          SizedBox(
                            width: 20,
                          ),
                          IconLabel(label: "Big C", icon: Icons.access_alarm),
                          SizedBox(
                            width: 20,
                          ),
                          IconLabel(label: "KFC Vietnam", icon: Icons.atm),
                          SizedBox(
                            width: 20,
                          ),
                          IconLabel(label: "Ahamove", icon: Icons.add_to_queue),
                          SizedBox(
                            width: 20,
                          ),
                          IconLabel(label: "LOSHIP", icon: Icons.add_to_queue),
                          SizedBox(
                            width: 20,
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
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Dịch vụ đối tác")),
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
          ]),*/
      ),
    );
  }
}
