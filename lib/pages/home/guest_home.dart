import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:cryptox/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../bottom_bar.dart';

class GuestHome extends StatefulWidget {
  @override
  _GuestHomeState createState() => _GuestHomeState();
}

class _GuestHomeState extends State<GuestHome> {
  final portfolioItem = [
    {
      'name': '24 KT GOLD',
      'shortName': 'BTC',
      'image': 'assets/crypto_icon/gold_ingots.png',
      'value': 'INR 4,580.00',
      'status': 'up',
      'change': '11.0%',
      'coinTotal': 'Buy Rate'
    },
    {
      'name': '24 KT GOLD',
      'shortName': 'BTC',
      'image': 'assets/crypto_icon/gold_ingots.png',
      'value': 'INR 4,380.00',
      'status': 'down',
      'change': '10.0%',
      'coinTotal': 'Sell Rate'
    }
  ];

  final howToVideo = [
    {
      'link': 'some link',
    },
    {
      'link': 'some link',
    },
    {
      'link': 'some link',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          userGreeting(),
          activityContainer(),
          currentPrice(),
          videos("How To Videos"),
          height20Space,
          videos("Testimonials"),
        ],
      ),
    );
  }

  currentPrice() {
    return ColumnBuilder(
      itemCount: portfolioItem.length,
      itemBuilder: (context, index) {
        final item = portfolioItem[index];
        return Padding(
          padding: (index != portfolioItem.length - 1)
              ? EdgeInsets.fromLTRB(
                  fixPadding * 2.0, fixPadding * 2.0, fixPadding * 2.0, 0.0)
              : EdgeInsets.all(fixPadding * 2.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              padding: EdgeInsets.all(fixPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: whiteColor,
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 4.0,
                //     spreadRadius: 1.0,
                //     color: blackColor.withOpacity(0.05),
                //   ),
                // ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    item['image'],
                    height: 40.0,
                    width: 40.0,
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
                              style: primaryColor18BoldTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${item['coinTotal']}',
                                  style: black12MediumTextStyle,
                                ),
                                widthSpace,
                                (item['status'] == 'up')
                                    ? Icon(
                                        Icons.arrow_drop_up,
                                        color: Colors.green,
                                      )
                                    : Icon(
                                        Icons.arrow_drop_down,
                                        color: primaryColor,
                                        size: 30,
                                      ),
                                Text(
                                  item['change'],
                                  style: black12MediumTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          item['value'],
                          style: black16BoldTextStyle,
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

  videos(String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: fixPadding * 2.0,
            bottom: fixPadding,
          ),
          child: Text(
            "$title",
            style: primaryColor18BoldTextStyle,
          ),
        ),
        Container(
          width: double.infinity,
          height: 178.0,
          child: ListView.builder(
            itemCount: howToVideo.length,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // final item = howToVideo[index];

              return Padding(
                padding: (index != howToVideo.length - 1)
                    ? EdgeInsets.only(left: fixPadding * 2.0)
                    : EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    width: 220.0,
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
                    child: InkWell(
                      child: Icon(
                        FontAwesomeIcons.youtube,
                        color: primaryColor,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

userGreeting() {
  return Padding(
    padding: EdgeInsets.all(fixPadding * 2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: grey16BoldTextStyle,
              ),
              heightSpace,
              Text(
                'To My Gold',
                style: black22BoldTextStyle,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            BuildContext context;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomBar(index: 4),
              ),
            );
          },
          borderRadius: BorderRadius.circular(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              'assets/user/guest.PNG',
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );
}

activityContainer() {
  return Container(
    padding: EdgeInsets.all(fixPadding * 2.0),
    margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: primaryColor,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You Can Do Following',
          style: white16BoldTextStyle,
        ),
        height20Space,
        acitivites("Buy And Save", "Save gold for Long Term Benefits",
            FontAwesomeIcons.solidCalendarCheck),
        height5Space,
        Divider(
          color: whiteColor,
          endIndent: 10,
          indent: 10,
          thickness: 1,
        ),
        height5Space,
        acitivites("Buy Instant Gold", "Save gold for Short Term Benefits",
            FontAwesomeIcons.snowflake),
        height5Space,
        Divider(
          color: whiteColor,
          endIndent: 10,
          indent: 10,
          thickness: 1,
        ),
        height5Space,
        acitivites("Refer and Earn", "Save gold for referring your friends",
            FontAwesomeIcons.shareAlt),
        height5Space,
        Divider(
          color: whiteColor,
          endIndent: 10,
          indent: 10,
          thickness: 1,
        ),
        height5Space,
        acitivites("Save Additional Bonus", "Save additonal bonus on plans",
            FontAwesomeIcons.piggyBank),
        height5Space,
        // Text(
        //   '\$4,50,933',
        //   style: white36BoldTextStyle,
        // ),
        // height20Space,
        // heightSpace,
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           'Monthly profit',
        //           style: white16MediumTextStyle,
        //         ),
        //         heightSpace,
        //         Text(
        //           '\$12,484',
        //           style: white26BoldTextStyle,
        //         ),
        //       ],
        //     ),
        //     Container(
        //       padding: EdgeInsets.all(fixPadding * 0.7),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20.0),
        //         color: whiteColor.withOpacity(0.2),
        //       ),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Icon(
        //             Icons.arrow_drop_up,
        //             size: 26.0,
        //             color: whiteColor,
        //           ),
        //           Text(
        //             '+10%',
        //             style: white14MediumTextStyle,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // )
      ],
    ),
  );
}

Container acitivites(String title, String detail, IconData icon) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 35.0,
          height: 35.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: scaffoldBgColor,
          ),
          child: Icon(
            icon,
            color: primaryColor,
            size: 23,
          ),
        ),
        widthSpace,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: white14BoldTextStyle,
              ),
              height5Space,
              Text(
                '$detail',
                style: white14BoldTextStyle,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
