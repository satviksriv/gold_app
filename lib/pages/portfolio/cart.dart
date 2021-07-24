import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:cryptox/widget/column_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final portfolioItem = [
    {
      'name': 'BTC',
      'image': 'assets/crypto_icon/btc.png',
      'value': '\$1,45,250',
      'status': 'up',
      'change': '20%',
    },
    {
      'name': 'ETH',
      'image': 'assets/crypto_icon/eth.png',
      'value': '\$2,50,245',
      'status': 'down',
      'change': '3%',
    }
  ];

  final popularCurrencyList = [
    {
      'name': 'Bitcoin',
      'shortName': 'BTC',
      'image': 'assets/crypto_icon/btc.png',
      'value': '\$10,136.73',
      'status': 'up',
      'change': '4.72%'
    },
    {
      'name': 'Ethereum',
      'shortName': 'ETH',
      'image': 'assets/crypto_icon/eth.png',
      'value': '\$185.65',
      'status': 'up',
      'change': '6.86%'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 2.0,
        child: Container(
          height: 50.0,
          width: width,
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  height: 50.0,
                  width: (width - 1.0) / 2,
                  alignment: Alignment.center,
                  child: Text(
                    'PROCEED'.toUpperCase(),
                    style: white18BoldTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: scaffoldBgColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          heightSpace,
          cartGold(),
          summary(),
          chosePaymentmethod(),
        ],
      ),
    );
  }

  cartGold() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ColumnBuilder(
          itemCount: popularCurrencyList.length,
          itemBuilder: (context, index) {
            final item = popularCurrencyList[index];
            return Padding(
              padding: (index != popularCurrencyList.length - 1)
                  ? EdgeInsets.fromLTRB(
                      fixPadding * 2.0, fixPadding * 2.0, fixPadding * 2.0, 0.0)
                  : EdgeInsets.all(fixPadding * 2.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.size,
                          alignment: Alignment.center,
                          child: CurrencyScreen()));
                },
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  padding: EdgeInsets.all(fixPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        color: blackColor.withOpacity(0.05),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        item['image'],
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.cover,
                      ),
                      widthSpace,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: black14MediumTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      item['shortName'],
                                      style: black12RegularTextStyle,
                                    ),
                                    widthSpace,
                                    (item['status'] == 'up')
                                        ? Icon(
                                            Icons.arrow_drop_up,
                                            color: primaryColor,
                                          )
                                        : Icon(
                                            Icons.arrow_drop_down,
                                            color: redColor,
                                          ),
                                    Text(
                                      item['change'],
                                      style: black12RegularTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              item['value'],
                              style: black16MediumTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  chosePaymentmethod() {
    return Container(
      height: 200,
      child: Padding(
        padding: EdgeInsets.all(fixPadding * 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              ' Choose Payment Mode',
              style: primaryColor18BoldTextStyle,
            ),
            heightSpace,
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            color: blackColor.withOpacity(0.05),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height5Space,
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            color: blackColor.withOpacity(0.05),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  summary() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ' Summary',
            style: primaryColor18BoldTextStyle,
          ),
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Sub-Total',
                      style: primaryColor16MediumTextStyle,
                    ),
                    Text(
                      'INR 134000',
                      style: primaryColor16MediumTextStyle,
                    ),
                  ],
                ),
                divider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Delivery Charges',
                      style: primaryColor16MediumTextStyle,
                    ),
                    Text(
                      'INR 134000',
                      style: primaryColor16MediumTextStyle,
                    ),
                  ],
                ),
                divider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Redeem Gold',
                      style: primaryColor16MediumTextStyle,
                    ),
                    Text(
                      'INR 134000',
                      style: primaryColor16MediumTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            child: Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: fixPadding * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Available Instant Gold Balance',
                            style: primaryColor14MediumTextStyle,
                          ),
                          Text(
                            '0.8 GRAM',
                            style: primaryColor14MediumTextStyle,
                          ),
                        ],
                      ),
                      Text(
                        'INR 134000',
                        style: primaryColor16MediumTextStyle,
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      color: blackColor.withOpacity(0.05),
                    ),
                  ],
                ),
              ),
            ),
          ),
          height20Space,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                ' TO PAY :',
                style: primaryColor18BoldTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: fixPadding * 2,
                ),
                child: Text(
                  ' INR 130000',
                  style: primaryColor18BoldTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
