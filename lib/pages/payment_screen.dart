import 'package:ewallet/pages/payment_success_screen.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final _controller = TextEditingController();
  final _msgController = TextEditingController();

  PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 390 / 670,
              child: Container(
                //TODO: Add background image decoration
                decoration: const BoxDecoration(color: Colors.redAccent),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final height = constraints.maxHeight;

                    final suggestIconHeight = height * 14 / 339;

                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Back button
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                          AspectRatio(
                            aspectRatio: 26 / 5,
                            child: Row(children: [
                              AspectRatio(
                                  aspectRatio: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Nguyễn Văn A',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text('Số dư: 100.000đ')
                                ],
                              )
                            ]),
                          ),
                          AspectRatio(
                            aspectRatio: 69 / 10,
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'Nhập mệnh giá',
                                suffixIcon: IconButton(
                                  onPressed: _controller.clear,
                                  icon: const Icon(Icons.clear),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildSuggestButton(suggestIconHeight, '100.000'),
                              buildSuggestButton(
                                  suggestIconHeight, '1.000.000'),
                              buildSuggestButton(
                                  suggestIconHeight, '10.000.000')
                            ],
                          ),
                          AspectRatio(
                            aspectRatio: 344 / 28,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const AspectRatio(
                                    aspectRatio: 1, child: Icon(Icons.home)),
                                Expanded(
                                  child: TextField(
                                    controller: _msgController,
                                    decoration: const InputDecoration(
                                      hintText: 'Bạn nhớ nhập lời nhắn nhé',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildRoundButton(suggestIconHeight, 'Chuyển tiền',
                                  () {
                                _msgController.text = 'Chuyển tiền';
                              }),
                              buildRoundButton(suggestIconHeight, 'Chúc zui',
                                  () {
                                _msgController.text = 'Chúc zui';
                              }),
                              buildRoundButton(
                                  suggestIconHeight, 'Hết nợ hết nghĩa!', () {
                                _msgController.text = 'Hết nợ hết nghĩa!';
                              })
                            ],
                          ),
                        ]);
                  },
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                final height = constraints.maxHeight;

                final themeButtonHeight = (height - 10) / 2;

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildThemeButton(themeButtonHeight),
                        const SizedBox(width: 5),
                        buildThemeButton(themeButtonHeight),
                      ],
                    ),
                    SizedBox(
                      height: themeButtonHeight,
                      child: AspectRatio(
                          aspectRatio: 241 / 48,
                          child: Container(
                              margin: const EdgeInsets.all(0),
                              decoration:
                                  const BoxDecoration(color: Colors.black26),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PaymentSuccessScreen()));
                                  },
                                  child: const Text(
                                    'Tiếp tục',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                              ))),
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildThemeButton(double height) {
    return Container(
      width: height,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }

  Container buildSuggestButton(double suggestIconHeight, String text) {
    text = '$textđ';
    return buildRoundButton(suggestIconHeight, text, () {
      _controller.text = text;
    });
  }

  Container buildRoundButton(
      double suggestIconHeight, String text, void Function()? onTap) {
    return Container(
      height: suggestIconHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Center(
          child: TextButton(
            onPressed: onTap,
            child: Text(text, style: const TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
