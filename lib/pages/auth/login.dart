import 'dart:io';

import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  DateTime currentBackPressTime;
  String phoneNumber = '';
  String phoneIsoCode;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  bool value = true;

  @override
  Widget buildCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          activeColor: primaryColor,
          value: value,
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
        ),
        Text(
          'Click here to recieve Whatsapp Notifications',
          style: black14RegularTextStyle,
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: WillPopScope(
        child: ListView(
          children: [
            SizedBox(height: 100.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Logo.png',
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30.0),
                Text(
                  'Signin with phone number',
                  style: grey14BoldTextStyle,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    fixPadding * 3.0,
                    20,
                    fixPadding * 3.0,
                    15,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: fixPadding * 2.0),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          color: blackColor.withOpacity(0.05),
                        ),
                      ],
                    ),
                    child: InternationalPhoneNumberInput(
                      textStyle: black14RegularTextStyle,
                      autoValidate: false,
                      selectorTextStyle: black16MediumTextStyle,
                      initialValue: number,
                      textFieldController: controller,
                      inputBorder: InputBorder.none,
                      inputDecoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 0.0),
                        hintText: 'Phone Number',
                        hintStyle: black16SemiBoldTextStyle,
                        border: InputBorder.none,
                      ),
                      selectorType: PhoneInputSelectorType.DIALOG,
                    ),
                  ),
                ),
                buildCheckbox(),
                heightSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding * 3.0, vertical: 15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Register(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: primaryColor,
                      ),
                      child: Text(
                        'Continue',
                        style: white18BoldTextStyle,
                      ),
                    ),
                  ),
                ),
                height20Space,
                Text(
                  'We’ll send otp for verification',
                  style: black14MediumTextStyle,
                ),
                height20Space,
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => GuestHome(),
                      ),
                    );
                  },
                  child: Text(
                    'Guest Login',
                    style: red16BoldTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
