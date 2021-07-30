import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';

class Itemdetails extends StatefulWidget {
  @override
  _ItemdetailsState createState() => _ItemdetailsState();
}

class _ItemdetailsState extends State<Itemdetails> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          '1 GRAM 24KT GOLD 99.99 PURE GOLD COIN',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: scaffoldBgColor,
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 2.0,
        child: Container(
          height: 50.0,
          width: width,
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  height: 50.0,
                  width: (width - 1.0) / 2,
                  alignment: Alignment.center,
                  child: Text(
                    'ADD TO CART'.toUpperCase(),
                    style: white16BoldTextStyle,
                  ),
                ),
              ),
              Container(
                height: 30.0,
                width: 1.0,
                color: whiteColor.withOpacity(0.5),
              ),
              InkWell(
                child: Container(
                  height: 50.0,
                  width: (width - 1.0) / 2,
                  alignment: Alignment.center,
                  child: Text(
                    'BUY NOW'.toUpperCase(),
                    style: white16BoldTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: whiteColor.withOpacity(0.5),
              child: Center(
                child: Image(
                  image: AssetImage('assets/crypto_icon/btc.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(fixPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryColor18BoldTextStyle,
                  ),
                  heightSpace,
                  Text(
                    'Metal Purity : 24KT (99.99%)',
                    style: primaryColor16BoldTextStyle,
                  ),
                  Text(
                    'Packaging : Tamperproof Packaging',
                    style: primaryColor16BoldTextStyle,
                  ),
                  Text(
                    'Weight : 1.0 gram',
                    style: primaryColor16BoldTextStyle,
                  ),
                  heightSpace,
                  Text(
                    'This item cannot be cancelled, returned or replaced once it has been ordered',
                    style: primaryColor16MediumTextStyle,
                  ),
                  height20Space,
                  height20Space,
                  Text(
                    'SKU Number',
                    style: primaryColor18BoldTextStyle,
                  ),
                  Text(
                    'BKS57656765',
                    style: black16BoldTextStyle,
                  ),
                  height20Space,
                  Text(
                    'CHARGES APPLIED',
                    style: primaryColor18BoldTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'GST',
                        style: black16BoldTextStyle,
                      ),
                      Text(
                        'INR 3666',
                        style: black16BoldTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      thickness: 1,
                      color: blackColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'MINTING',
                        style: black16BoldTextStyle,
                      ),
                      Text(
                        'INR 3666',
                        style: black16BoldTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
