import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shohaara/LoginScreens/LoginPage.dart';

import '../constants.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: 120,
              child: Text(
                "شعراء",
                style: TextStyle(
                    shadows: [
                      Shadow(
                        color: kPrimaryColor.withOpacity(0.4),
                        blurRadius: 18.0,
                        offset: Offset(5.0, 7.0),
                      ),
                    ],
                    fontSize: 80,
                    fontFamily: "A.Ali_banner3az.ir",
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor),
              ),
            ),
            SizedBox(
              height: 140,
            ),
            Container(
              alignment: Alignment.center,
              width: 300,
              height: 100,
              child: Text(
                textAlign: TextAlign.center,
                "خوش آمدید ",
                style: const TextStyle(
                    fontSize: 40,
                    fontFamily: "Vazir",
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ),
            SizedBox(
              height: 140,
            ),
          ],
        ),
      ),
    );
  }
}
