import 'dart:async';

import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    //Your work starts here****************************************

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                ),
                SizedBox(
                  height: 150,
                ),
                Image.asset(
                  'assets/Logo.png',
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
                height20Space,
                height20Space,
                Text(
                  'BKS MyGOLD',
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 26,
                      color: primaryColor,
                      fontWeight: FontWeight.w700),
                ),
                heightSpace,
                SizedBox(
                  width: 80,
                  child: Divider(
                    thickness: 1,
                    color: primaryColor,
                  ),
                ),
                height20Space,
                Text(
                  'BUY TODAY',
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 25,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'SAVE FOR TOMMOWROW',
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 25,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 200,
                ),
                Text(
                  'A VENTURE OF',
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 25,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'B.K.SARAF PVT JEWELLERS',
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 25,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Positioned(
              bottom: 30.0,
              child: Container(
                width: width,
                child: SpinKitRing(
                  color: primaryColor,
                  size: 15,
                  lineWidth: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Your work ends here****************************************
