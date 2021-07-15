import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
// import 'package:cryptox/widget/column_builder.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'package:page_transition/page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key key}) : super(key: key);

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  // final portfolioItem = [
  //   {
  //     'name': 'Bitcoin',
  //     'shortName': 'BTC',
  //     'image': 'assets/crypto_icon/btc.png',
  //     'value': '\$1,45,250',
  //     'status': 'up',
  //     'change': '5.26%',
  //     'coinTotal': '2.685'
  //   },
  //   {
  //     'name': 'Ethereum',
  //     'shortName': 'ETH',
  //     'image': 'assets/crypto_icon/eth.png',
  //     'value': '\$2,50,245',
  //     'status': 'down',
  //     'change': '2.56%',
  //     'coinTotal': '15.0256'
  //   }
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Center(
          child: Text(
            'Your Portfolio',
            style: primaryColor18BoldTextStyle,
          ),
        ),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          portfolioValue(),
          currentBalance('Total Gold Saved In Plans', '10.60 GRAM',
              'check plans', FontAwesomeIcons.calendarCheck),
          currentBalance(
            'Total Instant Gold Available',
            '5.20 GRAM',
            'sell gold',
            FontAwesomeIcons.calendarCheck,
          ), //TODO: change the icon
          currentBalance('Total Referral Bonus', '1.58 GRAM', 'refer to friend',
              FontAwesomeIcons.calendarCheck), //TODO: change the icon
          currentBalance('Total Plan Bonus', '1.80 GRAM', 'enrol new plan',
              FontAwesomeIcons.calendarCheck), //TODO: change the icon
          // myPortfolioItems(),
        ],
      ),
    );
  }

  portfolioValue() {
    // double width = MediaQuery.of(context).size.width;
    return Material(
      elevation: 2.0,
      child: Container(
        padding: EdgeInsets.only(bottom: fixPadding * 1.5),
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            valueItem('Total Saved', '15.80 GRAM'),
            Container(
              height: 40.0,
              width: 1,
              color: primaryColor,
            ),
            valueItem('Current Value', 'INR 56,869.30'),
            // Container(
            //   width: (width) / 3,
            //   padding: EdgeInsets.only(left: fixPadding * 2.0),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Gain/Loss',
            //         style: grey12RegularTextStyle,
            //       ),
            //       height5Space,
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Icon(
            //             Icons.arrow_drop_up,
            //             size: 25.0,
            //             color: primaryColor,
            //           ),
            //           Text(
            //             '5.2%',
            //             style: primaryColor16MediumTextStyle,
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  valueItem(title, value) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: (width) / 3,
      padding: EdgeInsets.only(left: fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: grey12BoldTextStyle,
              ),
              height5Space,
              Text(
                value,
                style: black16SemiBoldTextStyle,
              ),
            ],
          ),
          // Container(
          //   height: 30.0,
          //   width: 0.7,
          //   color: greyColor.withOpacity(0.6),
          // )
        ],
      ),
    );
  }

  currentBalance(
    String mainText,
    String amount,
    String bottomText,
    IconData icons,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          fixPadding * 2.0, fixPadding * 2.0, fixPadding * 2.0, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: whiteColor,
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 4.0,
          //     spreadRadius: 1.0,
          //     color: blackColor.withOpacity(0.05),
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.size,
                        alignment: Alignment.bottomCenter,
                        child: TotalBalance()));
              },
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.all(fixPadding * 1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0),
                  ),
                  color: whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: scaffoldBgColor,
                          ),
                          child: Icon(
                            icons, // TODO; claendar icon / snow icon / share icon / bank icon
                            color: primaryColor,
                            size: 30,
                          ),
                        ),
                        widthSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$mainText',
                              style: grey12BoldTextStyle,
                            ),
                            height5Space,
                            Text(
                              '$amount',
                              style: black16SemiBoldTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 27.0,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.size,
                        alignment: Alignment.bottomCenter,
                        child: Deposit()));
              },
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.all(fixPadding),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10.0),
                  ),
                  color: Colors.white,
                ),
                child: Text(
                  '$bottomText'.toUpperCase(),
                  style: primaryColor16BoldTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // myPortfolioItems() {
  //   return ColumnBuilder(
  //     itemCount: portfolioItem.length,
  //     itemBuilder: (context, index) {
  //       final item = portfolioItem[index];
  //       return Padding(
  //         padding: (index != portfolioItem.length - 1)
  //              EdgeInsets.fromLTRB(
  //                 fixPadding * 2.0, fixPadding * 2.0, fixPadding * 2.0, 0.0)
  //             : EdgeInsets.all(fixPadding * 2.0),
  //         child: InkWell(
  //           onTap: () {
  //             Navigator.push(
  //                 context,
  //                 PageTransition(
  //                     type: PageTransitionType.size,
  //                     alignment: Alignment.center,
  //                     child: CurrencyScreen()));
  //           },
  //           borderRadius: BorderRadius.circular(20.0),
  //           child: Container(
  //             padding: EdgeInsets.all(fixPadding),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20.0),
  //               color: whiteColor,
  //               boxShadow: [
  //                 BoxShadow(
  //                   blurRadius: 4.0,
  //                   spreadRadius: 1.0,
  //                   color: blackColor.withOpacity(0.05),
  //                 ),
  //               ],
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Image.asset(
  //                   item['image'],
  //                   height: 50.0,
  //                   width: 50.0,
  //                   fit: BoxFit.cover,
  //                 ),
  //                 widthSpace,
  //                 Expanded(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             item['name'],
  //                             style: black14MediumTextStyle,
  //                           ),
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             children: [
  //                               Text(
  //                                 '${item['coinTotal']} ${item['shortName']}',
  //                                 style: black12RegularTextStyle,
  //                               ),
  //                               widthSpace,
  //                               (item['status'] == 'up')
  //                                   ? Icon(
  //                                       Icons.arrow_drop_up,
  //                                       color: primaryColor,
  //                                     )
  //                                   : Icon(
  //                                       Icons.arrow_drop_down,
  //                                       color: redColor,
  //                                     ),
  //                               Text(
  //                                 item['change'],
  //                                 style: black12RegularTextStyle,
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                       Text(
  //                         item['value'],
  //                         style: black16MediumTextStyle,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
