import 'package:flutter/material.dart';
import 'package:myfamily/screens/loginPage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.data}) : super(key: key);

  dynamic data;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text('Welcome ' + widget.data['name']),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => Loginpage()));
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(child: Text("Hello " + widget.data['name'])),
    );
  }
}
