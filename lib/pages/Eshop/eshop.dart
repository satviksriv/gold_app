import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';

class Eshop extends StatefulWidget {
  const Eshop({Key key}) : super(key: key);

  @override
  _EshopState createState() => _EshopState();
}

class _EshopState extends State<Eshop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: scaffoldBgColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: Text(
            '!Market is up 2.06% today',
            style: TextStyle(
              fontSize: 16.0,
              color: greenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Gold Coins',
              ),
              Tab(text: 'Gold Ingots'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Goldcoins(),
            Completed(),
          ],
        ),
      ),
    );
  }
}
