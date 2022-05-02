import 'package:flutter/material.dart';
import 'package:myfamily/localDatabase/familyModel.dart';
import 'package:myfamily/screens/loginPage.dart';
import '../localDatabase/serviceFile.dart';

class SigupPage extends StatefulWidget {
  const SigupPage({Key? key}) : super(key: key);

  @override
  State<SigupPage> createState() => _SigupPageState();
}

final signInglobalKey = GlobalKey<FormState>();
dynamic confirmPassword;

saveDataToDb() {
  Login login = Login();
  login.name = nameCtl.text;
  login.email = emailCtl.text;
  login.age = ageCtl.text;
  login.password = passCtl.text;
  login.confirmPassword = conPassCtl.text;
  LoginService().saveLogin(login);
}

clearText() {
  nameCtl.text = '';
  emailCtl.text = '';
  ageCtl.text = '';
  passCtl.text = '';
  conPassCtl.text = '';
}

TextEditingController nameCtl = TextEditingController();
TextEditingController emailCtl = TextEditingController();
TextEditingController ageCtl = TextEditingController();
TextEditingController passCtl = TextEditingController();
TextEditingController conPassCtl = TextEditingController();

class _SigupPageState extends State<SigupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: signInglobalKey,
          child: SingleChildScrollView(
            child: Container(
              color: Color.fromARGB(255, 253, 249, 234),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.95,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.account_circle,
                          size: 50, color: Colors.blue),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Sign Up ',
                        style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: nameCtl,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'Please enter your name',
                            labelText: 'Name',
                            // border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  nameCtl.clear();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  size: 20,
                                ))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Name';
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        controller: emailCtl,
                        decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: 'Enter your email ID',
                            labelText: ' Email',
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
                      TextFormField(
                        controller: ageCtl,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person_add_alt_outlined),
                            hintText: 'Enter your age',
                            labelText: ' Age',
                            // border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  ageCtl.clear();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  size: 20,
                                ))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age';
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passCtl,
                        decoration: InputDecoration(
                            icon: Icon(Icons.password_outlined),
                            hintText: 'Enter a new password',
                            labelText: ' Password',
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
                          confirmPassword = value;
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                          obscureText: true,
                          controller: conPassCtl,
                          decoration: InputDecoration(
                              icon: Icon(Icons.paste),
                              hintText: 'Enter re-enter password ',
                              labelText: 'Confirm password',
                              // border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    conPassCtl.clear();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    size: 20,
                                  ))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please re-enter password';
                            } else if (value != confirmPassword) {
                              return 'Enter password is wrong';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'already have  a  account ',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>   Loginpage()),
                                );
                              },
                              child: const Text(
                                'LogIn',
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
                      ),
                      TextButton(
                          onPressed: () {}, child: Text('Forget password')),
                      ElevatedButton(
                          onPressed: () {
                            if (signInglobalKey.currentState!.validate()) {
                              saveDataToDb();
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>   Loginpage()));
                              clearText();
                            }
                          },
                          child: Text('Sign up'))
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
