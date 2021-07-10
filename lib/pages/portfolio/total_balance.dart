import 'package:clipboard/clipboard.dart';
import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:cryptox/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class TotalBalance extends StatefulWidget {
  const TotalBalance({Key key}) : super(key: key);

  @override
  _TotalBalanceState createState() => _TotalBalanceState();
}

class _TotalBalanceState extends State<TotalBalance> {
  final transactionDetailList = [
    {
      'type': 'deposit',
      'status': 'success',
      'amount': 'INR 4,586.00', // TODO: change to gram
      'dateTime': 'May 10,2021 9:02:23 PM'
    },
    {
      'type': 'withdraw',
      'status': 'success',
      'amount': 'INR 488.50', // TODO: change to gram
      'dateTime': 'April 20,2021 7:02:23 PM'
    },
    {
      'type': 'deposit',
      'status': 'fail',
      'amount': 'INR 488.50', // TODO: change to gram
      'dateTime': 'April 10,2021 6:02:24 PM'
    },
    {
      'type': 'deposit',
      'status': 'success',
      'amount': 'INR 4,396.00', // TODO: change to gram
      'dateTime': 'March 10,2021 9:02:23 PM'
    }
  ];

  transactionDetailDialogue(status, amount, dateTime) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Wrap(
            children: [
              Container(
                color: scaffoldBgColor,
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close_sharp,
                          color: primaryColor,
                          size: 35.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: (status == 'success') ? greenColor : redColor,
                      ),
                      child: Icon(
                        (status == 'success') ? Icons.done : Icons.close,
                        size: 40.0,
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      amount, // TODO: Change to GRAM
                      style: black18BoldTextStyle,
                    ),
                    height5Space,
                    Text(
                      (status == 'success')
                          ? 'Success'.toUpperCase()
                          : 'Fail'.toUpperCase(),
                      style: black16BoldTextStyle,
                    ),
                    height5Space,
                    Text(
                      dateTime,
                      style: grey12BoldTextStyle,
                    ),
                    height20Space,
                    InkWell(
                      onTap: () {
                        FlutterClipboard.copy('UQDKDRX879J').then((value) {
                          Fluttertoast.showToast(
                            msg: 'Copied to clipboard',
                            backgroundColor: Colors.black,
                            textColor: whiteColor,
                          );
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(fixPadding),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: whiteColor,
                        ),
                        child: Center(
                          child: Text(
                            'UQDKDRX879J',
                            style: grey14BoldTextStyle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      'Tap to copy Reference ID',
                      style: grey12BoldTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.clear_sharp,
            color: primaryColor,
            size: 35,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '24 KT GOLD',
          style: primaryColor22BoldTextStyle,
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
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.size,
                          alignment: Alignment.bottomCenter,
                          child: Deposit()));
                },
                child: Container(
                  height: 50.0,
                  width: (width - 1.0) / 2,
                  alignment: Alignment.center,
                  child: Text(
                    'Buy gold'.toUpperCase(),
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
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.size,
                          alignment: Alignment.bottomCenter,
                          child: Withdraw()));
                },
                child: Container(
                  height: 50.0,
                  width: (width - 1.0) / 2,
                  alignment: Alignment.center,
                  child: Text(
                    'sell/redeem'.toUpperCase(),
                    style: white16BoldTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 25,
            child: Container(
              color: whiteColor,
            ),
          ),
          balanceData(),
          transaction(),
        ],
      ),
    );
  }

  balanceData() {
    double width = MediaQuery.of(context).size.width;
    return Material(
      elevation: 2.0,
      child: Container(
        color: whiteColor,
        padding: EdgeInsets.fromLTRB(
            fixPadding * 2.0, 0, fixPadding * 2.0, fixPadding * 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Available Balance',
              style: grey14BoldTextStyle,
            ),
            heightSpace,
            Text(
              '15.80 GRAM',
              style: black18BoldTextStyle,
            ),
            height20Space,
            Container(
              width: width - fixPadding * 4.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  depositWithdrawalItem('Total Saved', '15.80 GRAM'),
                  Container(
                    height: 34.0,
                    width: 0.7,
                    color: whiteColor,
                  ),
                  depositWithdrawalItem('Bonus Earned', '1.80 GRAM'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  depositWithdrawalItem(title, value) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: (width - fixPadding * 4.0 - 0.7) / 2,
      alignment: Alignment.center,
      padding: EdgeInsets.all(fixPadding * 1.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: white14BoldTextStyle,
          ),
          height5Space,
          Text(
            value,
            style: white18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  transaction() {
    return ColumnBuilder(
      itemCount: transactionDetailList.length,
      itemBuilder: (context, index) {
        final item = transactionDetailList[index];
        return InkWell(
          onTap: () => transactionDetailDialogue(
              item['status'], item['amount'], item['dateTime']),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(fixPadding * 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: (item['status'] == 'success')
                                ? greenColor
                                : redColor,
                          ),
                          child: Icon(
                            (item['type'] == 'deposit' &&
                                    item['status'] == 'success')
                                ? Icons.call_received
                                : (item['type'] == 'withdraw' &&
                                        item['status'] == 'success')
                                    ? Icons.call_made
                                    : Icons.close_sharp,
                            color: whiteColor,
                            size: 22.0,
                          ),
                        ),
                        widthSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (item['type'] == 'deposit' &&
                                      item['status'] == 'success')
                                  ? 'GRAM SAVED' // TODO: amount not shown
                                  : (item['type'] == 'deposit' &&
                                          item['status'] == 'fail')
                                      ? 'GRAM ON HOLD' // TODO: amount not shown
                                      : "GRAM RELEASED", // TODO: amount not shown
                              style: black16SemiBoldTextStyle,
                            ),
                            height5Space,
                            Text(
                              item['dateTime'],
                              style: grey12BoldTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      item['amount'],
                      style: black16BoldTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                child: Container(
                  height: 1.0,
                  width: double.infinity,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}