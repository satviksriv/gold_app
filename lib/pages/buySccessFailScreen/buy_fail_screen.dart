import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BuyFailScreen extends StatelessWidget {
  const BuyFailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: scaffoldBgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                height20Space,
                height20Space,
                height20Space,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                  child: Text(
                    'Oops.. Something Went Wrong!',
                    style: black18SemiBoldTextStyle,
                  ),
                ),
              ],
            ),
            Container(
              width: 140.0,
              height: 140.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.0),
                color: redColor.withOpacity(0.3),
              ),
              child: Container(
                width: 110.0,
                height: 110.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55.0),
                  color: redColor,
                ),
                child: Icon(
                  Icons.clear_sharp,
                  size: 50.0,
                  color: whiteColor,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width - fixPadding * 4.0,
                  child: Text(
                    'You order of buy 2.0658 Bitcoin (Btc) at price of \$37,568 has cancelled unfortunately. Try again.',
                    style: grey14MediumTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                height20Space,
                Padding(
                  padding: const EdgeInsets.all(fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: BottomBar(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(7.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(fixPadding * 1.7),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: redColor,
                      ),
                      child: Text(
                        'Okay!',
                        style: white16MediumTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
