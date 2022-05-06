import 'package:flutter/material.dart';
import 'package:myfamily/screens/mainPage.dart';

import '../localDatabase/serviceFile.dart';
import 'signupPage.dart';

final darkNotifier = ValueNotifier<bool>(false);
bool isDark = darkNotifier.value;

class Loginpage extends StatefulWidget {
  Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: darkNotifier,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(primaryColor: Colors.blue),
            darkTheme: ThemeData.dark(),
            home: Scaffold(
              appBar: AppBar(
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      isDark = !isDark;
                      darkNotifier.value = isDark;
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                      child: Icon(isDark
                          ? Icons.wb_sunny_outlined
                          : Icons.bubble_chart),
                    ),
                  )
                ],
              ),
              body: loginPage(),
            ),
          );
        });
  }
}

class loginPage extends StatefulWidget {
  loginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final loginGlobalKey = GlobalKey<FormState>();

  TextEditingController emailCtl = TextEditingController();

  TextEditingController passCtl = TextEditingController();

  clearItem() {
    emailCtl.text = "";
    passCtl.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginGlobalKey,
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.account_circle, size: 100, color: Colors.blue),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'LogIn ',
            style: TextStyle(
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailCtl,
            decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter your email ID',
                labelText: 'Username or email',
                // border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      emailCtl.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                    ))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }

              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: true,
            controller: passCtl,
            decoration: InputDecoration(
                icon: Icon(Icons.paste),
                hintText: 'Enter your password ',
                labelText: 'Password',
                // border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      passCtl.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                    ))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }

              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create a new account ',
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigupPage()),
                    );
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
          TextButton(onPressed: () {}, child: const Text('Forget password')),
          ElevatedButton(
              onPressed: () async {
                if (loginGlobalKey.currentState!.validate()) {
                  var value = await LoginService()
                      .checkValidUser(emailCtl.text, passCtl.text);

                  if (value.length > 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPage(data: value[0])));
                    clearItem();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid Credentials')),
                    );
                  }
                }
              },
              child: Text('Log in ')),
        ]),
      ),
    );
  }
}
