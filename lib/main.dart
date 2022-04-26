import 'package:flutter/material.dart';
import 'package:myfamily/splashScreen/splashScreen.dart';

void main() {
  runApp(const MyFamily());
}

class MyFamily extends StatefulWidget {
  const MyFamily({Key? key}) : super(key: key);

  @override
  State<MyFamily> createState() => _MyFamilyState();
}

class _MyFamilyState extends State<MyFamily> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My Family",
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
