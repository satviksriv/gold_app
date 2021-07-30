import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/Eshop/itemdetails.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Goldcoins extends StatefulWidget {
  const Goldcoins({Key key}) : super(key: key);

  @override
  _GoldcoinsState createState() => _GoldcoinsState();
}

class _GoldcoinsState extends State<Goldcoins> {
  // final allList = [
  //   {
  //     'name': 'Bitcoin',
  //     'shortName': 'BTC',
  //     'image': 'assets/crypto_icon/btc.png',
  //     'value': '\$10,136.73',
  //     'status': 'up',
  //     'change': '4.72%'
  //   },
  //   {
  //     'name': 'Ethereum',
  //     'shortName': 'ETH',
  //     'image': 'assets/crypto_icon/eth.png',
  //     'value': '\$185.65',
  //     'status': 'up',
  //     'change': '6.86%'
  //   },
  //   {
  //     'name': 'XRP',
  //     'shortName': 'XRP',
  //     'image': 'assets/crypto_icon/xrp.png',
  //     'value': '\$0.262855',
  //     'status': 'down',
  //     'change': '8.95%'
  //   },
  //   {
  //     'name': 'Bitcoin Cash',
  //     'shortName': 'BCH',
  //     'image': 'assets/crypto_icon/bch.png',
  //     'value': '\$297.98',
  //     'status': 'up',
  //     'change': '4.55%'
  //   },
  //   {
  //     'name': 'Litecoin',
  //     'shortName': 'LTC',
  //     'image': 'assets/crypto_icon/ltc.png',
  //     'value': '\$71.24',
  //     'status': 'up',
  //     'change': '7.12%'
  //   },
  //   {
  //     'name': 'Binance Coin',
  //     'shortName': 'BNB',
  //     'image': 'assets/crypto_icon/bnb.png',
  //     'value': '\$27.11',
  //     'status': 'down',
  //     'change': '3.43%'
  //   },
  //   {
  //     'name': 'EOS',
  //     'shortName': 'EOS',
  //     'image': 'assets/crypto_icon/eos.png',
  //     'value': '\$3.44',
  //     'status': 'down',
  //     'change': '5.27%'
  //   },
  //   {
  //     'name': 'Monero',
  //     'shortName': 'XMR',
  //     'image': 'assets/crypto_icon/xmr.png',
  //     'value': '\$1.54',
  //     'status': 'up',
  //     'change': '3.25%'
  //   },
  //   {
  //     'name': 'Tether',
  //     'shortName': 'USDT',
  //     'image': 'assets/crypto_icon/usdt.png',
  //     'value': '\$1.23',
  //     'status': 'up',
  //     'change': '9.71%'
  //   }
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(fixPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Reusablecard(
                      coinweight: 2,
                      price: 4600,
                    ),
                  ),
                  widthSpace,
                  Expanded(
                    child: Reusablecard(
                      coinweight: 10,
                      price: 408888,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Reusablecard extends StatelessWidget {
  Reusablecard({this.coinweight, this.price});

  final int coinweight;

  final int price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Itemdetails();
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 1,
              color: blackColor.withOpacity(0.05),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                    ),
                    Expanded(
                      child: Image(
                        image: AssetImage('assets/crypto_icon/btc.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: scaffoldBgColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(fixPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      '$coinweight GRAM 24KT GOLD',
                      style: primaryColor14MediumTextStyle,
                    ),
                    Text(
                      '99.99 PURE GOLD COIN',
                      style: primaryColor14MediumTextStyle,
                    ),
                    heightSpace,
                    Text(
                      'INR $price',
                      style: black16BoldTextStyle,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
