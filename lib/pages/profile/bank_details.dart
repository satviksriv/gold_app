import 'package:cryptox/constant/constant.dart';
import 'package:flutter/material.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({Key key}) : super(key: key);

  @override
  _BankDetailsState createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  String selectedAccountType = 'Savings';
  final accountNumberController = TextEditingController();
  final ifscCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    accountNumberController.text = '630501551161';
    ifscCodeController.text = 'ICIC0006305';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        titleSpacing: 0.0,
        title: Text(
          'YOUR BANK DETAILS',
          style: white16SemiBoldTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: bankDetail(),
    );
  }

  // info() {
  //   return Container(
  //     padding: EdgeInsets.all(fixPadding * 2.0),
  //     color: greyColor.withOpacity(0.25),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Icon(
  //           Icons.check_circle,
  //           size: 30.0,
  //           color: greenColor,
  //         ),
  //         widthSpace,
  //         Expanded(
  //           child: Text(
  //             'Congratulations! You have successfully added your bank account details.',
  //             style: black14RegularTextStyle,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  bankDetail() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 3.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name Field Start

          Container(
            padding: EdgeInsets.only(bottom: fixPadding * 2.0),
            child: Theme(
              data: ThemeData(
                primaryColor: whiteColor,
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: primaryColor,
                ),
              ),
              child: TextField(
                controller: accountNumberController,
                keyboardType: TextInputType.number,
                style: primaryColor16BoldTextStyle,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                  labelStyle: primaryColor16BoldTextStyle,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: primaryColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: primaryColor, width: 1),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
          ),
          // Name Field End

          // IFSC Code Field Start
          Container(
            padding: EdgeInsets.only(bottom: fixPadding * 2.0),
            child: Theme(
              data: ThemeData(
                primaryColor: whiteColor,
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: primaryColor,
                ),
              ),
              child: TextField(
                controller: ifscCodeController,
                keyboardType: TextInputType.text,
                style: primaryColor16BoldTextStyle,
                decoration: InputDecoration(
                  labelText: 'IFSC Code',
                  labelStyle: primaryColor16BoldTextStyle,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: primaryColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: primaryColor, width: 1),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
          ),
          // IFSC Code Field End

          // Select Account Type Start
          Text(
            'Select Account Type',
            style: primaryColor16BoldTextStyle,
          ),
          heightSpace,

          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              selectAccountTypeItem('Savings'),
              selectAccountTypeItem('Current'),
            ],
          ),

          // Select Account Type End

          height20Space,

          // Save Button Start
          InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(7.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(fixPadding * 1.5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: primaryColor,
              ),
              child: Text(
                'Proceed',
                style: white14BoldTextStyle,
              ),
            ),
          ),
          // Save Button End
        ],
      ),
    );
  }

  selectAccountTypeItem(type) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedAccountType = type;
          });
        },
        child: Container(
          width: (width - fixPadding * 4.0) / 2,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 18.0,
                height: 18.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(
                    width: 0.8,
                    color: (selectedAccountType == type)
                        ? primaryColor
                        : greenColor,
                  ),
                ),
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: (selectedAccountType == type)
                        ? primaryColor
                        : whiteColor,
                  ),
                ),
              ),
              widthSpace,
              Text(
                type,
                style: primaryColor16BoldTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
