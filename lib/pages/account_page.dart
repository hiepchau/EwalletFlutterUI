import 'package:ewallet/pages/widgets/profile_widget.dart';
import 'package:ewallet/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../balance_lists.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: primary,
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
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      child: const CircleAvatar(
                        backgroundImage:
                        NetworkImage("https://www.woolha.com/media/2020/03/eevee.png"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hiep Chau",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SVN-Gotham',
                            fontWeight: FontWeight.bold,),
                        ),
                        Text(
                          "0999000999",
                          style: TextStyle(
                              fontSize: 15,
                              color: grey,
                              fontFamily: 'SVN-Gotham'),
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
          const ProfileWidget(icon: AntDesign.qrcode,
              iconColor: green,
              title: 'QR Code',
              subtitle: ''),
          const ProfileWidget(icon: Icons.account_balance_wallet,
              iconColor: green,
              title: 'Balance',
              subtitle: '10.000.000d'),
          const ProfileWidget(icon: Icons.currency_exchange,
              iconColor: yellow,
              title: 'Coin',
              subtitle:'Earn coin'),
          const ProfileWidget(icon: Icons.card_giftcard,
              iconColor: red,
              title: 'Gift cards',
              subtitle:'3 uu dai',
              subtitleColor: primary),
          const SizedBox(
            height: 10,
          ),
          const ProfileWidget(icon: AntDesign.bank,
            iconColor: secondary,
            title: 'Bank',
            subtitle:'1connected',
          ),
          const ProfileWidget(icon: Icons.production_quantity_limits,
            iconColor: secondary,
            title: 'Bills',
            subtitle:'',
          ),
          const ProfileWidget(icon: Icons.history_edu,
            iconColor: primary,
            title: 'Lien ket thanh toan',
            subtitle:'',
          ),
          const ProfileWidget(icon: Icons.link,
            iconColor: purple,
            title: 'Dich vu lien ket',
            subtitle:'',
          ),
          const SizedBox(
            height: 10,
          ),
          const ProfileWidget(icon: Icons.settings,
              iconColor: grey,
              title: 'Settings',
              subtitle:''),
          const ProfileWidget(icon: Icons.headphones_sharp,
              iconColor: grey,
              title: 'Support center',
              subtitle:''),
          const ProfileWidget(icon: AntDesign.info,
              iconColor: grey,
              title: 'Thong tin ung dung ',
              subtitle:''),
          const SizedBox(
            height: 10,
          ),
          const ProfileWidget(icon: AntDesign.logout,
              iconColor: grey,
              title: 'Logout',
              subtitle:''),
        ],
      ),
    );
  }

}
