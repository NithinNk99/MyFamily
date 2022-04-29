import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myfamily/screens/loginPage.dart';

import '../screens/mainPage.dart';
import '../screens/signupPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>   Loginpage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(
        "assets/family.logo.gif",
      ),
    );
  }
}
