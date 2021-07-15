import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';

class Running extends StatefulWidget {
  const Running({Key key}) : super(key: key);

  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Running> {
  final runningItem = [
    {
      'name': 'Total Saved Gold In This Plan',
      'amount': '15.80 GRAM',
      'image': 'assets/crypto_icon/gold_ingots.png',
      'value': '\$185.65',
      'status': 'up',
      'change': '6.86%'
    },
    {
      'name': 'Total Saved Gold In This Plan',
      'amount': '13.10 GRAM',
      'image': 'assets/crypto_icon/gold_ingots.png',
      'value': '\$0.262855',
      'status': 'down',
      'change': '8.95%'
    },
    {
      'name': 'Total Saved Gold In This Plan',
      'amount': '10.20 GRAM',
      'image': 'assets/crypto_icon/gold_ingots.png',
      'value': '\$297.98',
      'status': 'up',
      'change': '4.55%'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return (runningItem.isEmpty)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: greyColor.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.remove_red_eye,
                  color: greyColor,
                  size: 55.0,
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'There are no plans running at this moment!',
                style: grey20BoldTextStyle,
              ),
            ],
          )
        : ListView.builder(
            itemCount: runningItem.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = runningItem[index];
              return Padding(
                padding: (index != runningItem.length - 1)
                    ? EdgeInsets.fromLTRB(fixPadding * 2.0, fixPadding * 2.0,
                        fixPadding * 2.0, 0.0)
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
                  child: Container(
                    height: 138,
                    width: 100,
                    decoration: BoxDecoration(
                      color: scaffoldBgColor,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              children: [
                                widthSpace,
                                Image.asset(
                                  item['image'],
                                  height: 44,
                                  width: 44,
                                  fit: BoxFit.cover,
                                ),
                                widthSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: grey14BoldTextStyle,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      item['amount'],
                                      style: black16BoldTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: primaryColor,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "BUY GOLD",
                                style: black14BoldTextStyle,
                              ),
                              Text(
                                "SKIP PAYMENT",
                                style: black14BoldTextStyle,
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
          );
  }
}


// Container(
//                       padding: EdgeInsets.all(fixPadding),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         color: whiteColor,
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 4.0,
//                             spreadRadius: 1.0,
//                             color: blackColor.withOpacity(0.05),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             item['image'],
//                             height: 50.0,
//                             width: 50.0,
//                             fit: BoxFit.cover,
//                           ),
//                           widthSpace,
//                           Expanded(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       item['name'],
//                                       style: black14MediumTextStyle,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           item['amount'],
//                                           style: black12RegularTextStyle,
//                                         ),
//                                         widthSpace,
//                                         (item['status'] == 'up')
//                                             ? Icon(
//                                                 Icons.arrow_drop_up,
//                                                 color: primaryColor,
//                                               )
//                                             : Icon(
//                                                 Icons.arrow_drop_down,
//                                                 color: redColor,
//                                               ),
//                                         Text(
//                                           item['change'],
//                                           style: black12RegularTextStyle,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 Text(
//                                   item['value'],
//                                   style: black16MediumTextStyle,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),