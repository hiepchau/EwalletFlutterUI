import 'package:ewallet/pages/widgets/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentConfirm extends StatelessWidget {
  const PaymentConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 390 / 520,
      child: Column(
        children: [
          Expanded(
              flex: 520 - 120,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Expanded(
                        flex: 48,
                        child: Stack(
                          children: [
                            Center(
                              child: Text('Xác nhận giao dịch',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.close,
                                      size: 20.w,
                                    )))
                          ],
                        )),
                    Expanded(
                      flex: 352,
                      child: Column(
                        children: [
                          AspectRatio(
                              aspectRatio: 360 / 179,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                          Icon(
                                            Icons.currency_exchange_rounded,
                                            size: 30.w,
                                          ),
                                          Text(
                                            '1.000.000đ',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            'Chuyển tiền đến Khôi Nghi',
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          DashedLine(),
                                        ] +
                                        buildLines([
                                          ['Người nhận', 'Khôi Nghi'],
                                          ['Số điện thoại', '0123456789'],
                                          [
                                            'Lời nhắn',
                                            'Hịp Châu iu Khôi Nghi <3'
                                          ],
                                          ['Phí giao dịch', 'Miễn phí'],
                                        ], context),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          AspectRatio(
                              aspectRatio: 360 / 61,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.lock),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Nguồn tiền thanh toán',
                                                  style: TextStyle(
                                                      fontSize: 15.sp)),
                                              Text('Số dư: 100.000.000đ',
                                                  style: TextStyle(
                                                      fontSize: 10.sp))
                                            ],
                                          )
                                        ],
                                      ),
                                      Text(
                                        'Thay đổi',
                                        style: TextStyle(fontSize: 10.sp),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 120,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Xác nhận giao dịch',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shield),
                          Text('Bảo mật tuyệt đối theo chuẩn cao nhất',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w300,
                              ))
                        ],
                      )
                    ],
                  ))),
        ],
      ),
    );
  }

  List<Widget> buildLines(List<List<String>> lines, BuildContext context) {
    return lines.map((line) {
      return IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                line[0],
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 10.sp,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                line[1],
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
