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
                Text(
                  'BKS MyGold',
                ),
                SizedBox(
                  width: 40,
                  child: Divider(
                    thickness: 3,
                  ),
                ),
                Text(
                  'BUY TODAY',
                ),
                Text(
                  'SAVE FOR TOMMOWROW',
                ),
                Text(
                  'A VENTURE OF',
                ),
                Text(
                  'B.K.SARAF PVT JEWELLERS',
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
