import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      AspectRatio(
        aspectRatio: 390 / 252,
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)))),
      ),
      Column(children: [
        Expanded(
            flex: 86,
            child: Container(
                child: Center(
              child: Text('Kết quả giao dịch',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
            ))),
        Expanded(
            flex: 438,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 15,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 48,
                    ),
                    const Text('Giao dịch thành công'),
                    const Text('500.000đ'),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 3, right: 3),
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              'Tiền đã được chuyển đến người nhận',
                              style: TextStyle(fontSize: 8),
                            )),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 20, bottom: 20),
                        child: Column(
                            children: buildLines([
                          ['Người gửi', 'Hiệp Châu'],
                          ['Người nhận', 'Khôi Nghi'],
                          ['SĐT', '0123456789'],
                          ['Lời nhắn', 'Hiệp Châu yêu Khôi <3'],
                          ['Thời gian thanh toán', '18:05 - 30/11/2022'],
                        ])),
                      ),
                    ),
                    Container(
                        height: 3,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        )),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.info_outline),
                                Text('Chi tiết giao dịch'),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('221130-123456789'),
                                Icon(Icons.arrow_right),
                              ],
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            )),
        Expanded(flex: 200, child: Container()),
        Expanded(
            flex: 76,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 10, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: const Center(
                    child: Text('Đóng',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ),
            )),
      ]),
    ])));
  }

  List<Widget> buildLines(List<List<String>> lines) {
    return lines.map((line) {
      return IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(line[0]),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(line[1]),
            ),
          ],
        ),
      );
    }).toList();
  }
}
