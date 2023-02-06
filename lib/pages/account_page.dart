import 'package:ewallet/pages/widgets/profile_widget.dart';
import 'package:ewallet/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import '../balance_lists.dart';
import '../style/constants.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài khoản'),
        automaticallyImplyLeading: false,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: getAccountSection(),
            ),
          ),
        ),
      ],
    );
  }

  Widget getAccountSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0,2)
                  ),
                ],
              ),
              child: Container(              
                padding: const EdgeInsets.fromLTRB(
                    20,  15,  20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 45,
                      height: 45,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.woolha.com/media/2020/03/eevee.png"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hiệp Châu",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )
                          ),
                          const Text(
                            "0999000999",
                            style: wGreyTextStyle,
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: green
                            ),
                          child: Text("Đã xác thực",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: onPrimary
                          ),),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Quản lí ví"),
          const ProfileWidget(
              icon: AntDesign.qrcode,
              iconColor: green,
              title: 'QR Code',
              subtitle: ''),
          const ProfileWidget(
              icon: Icons.account_balance_wallet,
              iconColor: green,
              title: 'Balance',
              subtitle: '10.000.000d'),
          const ProfileWidget(
              icon: Icons.currency_exchange,
              iconColor: yellow,
              title: 'Coin',
              subtitle: 'Earn coin'),
          ProfileWidget(
              icon: Icons.card_giftcard,
              iconColor: red,
              title: 'Gift cards',
              subtitle: '3 uu dai',
              subtitleColor: primary),
          const SizedBox(
            height: 10,
          ),
           ProfileWidget(
            icon: AntDesign.bank,
            iconColor: primary,
            title: 'Bank',
            subtitle: '1connected',
          ),
          ProfileWidget(
            icon: Icons.production_quantity_limits,
            iconColor: secondary,
            title: 'Bills',
            subtitle: '',
          ),
          ProfileWidget(
            icon: Icons.history_edu,
            iconColor: primary,
            title: 'Lien ket thanh toan',
            subtitle: '',
          ),
          const ProfileWidget(
            icon: Icons.link,
            iconColor: purple,
            title: 'Dich vu lien ket',
            subtitle: '',
          ),
          const SizedBox(
            height: 10,
          ),
          const ProfileWidget(
              icon: Icons.settings,
              iconColor: grey,
              title: 'Settings',
              subtitle: ''),
          const ProfileWidget(
              icon: Icons.headphones_sharp,
              iconColor: grey,
              title: 'Support center',
              subtitle: ''),
          const ProfileWidget(
              icon: AntDesign.info,
              iconColor: grey,
              title: 'Thong tin ung dung ',
              subtitle: ''),
          const SizedBox(
            height: 10,
          ),
          const ProfileWidget(
              icon: AntDesign.logout,
              iconColor: grey,
              title: 'Logout',
              subtitle: ''),
        ],
      ),
    );
  }
}
