import 'package:eco_trash/services/eco_trash_db_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:quickalert/quickalert.dart';
import 'package:http/http.dart' as http;
import 'package:eco_trash/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void sendUser() async {
    try {
      await AuthService().login(_email!, _password!);
      loginConfirm();
    } catch (er) {
      print(er.toString());
      loginError();
    }
  }

  void loginConfirm() async {
    final user = await EcoTrashDBService.instance.getUser();
    if (user != null) {
      String role = user['role'];
      String route = _getHomeRoute(role);

      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: "Login",
        text: 'Successful!',
        confirmBtnText: 'Continue',
        confirmBtnColor: const Color.fromARGB(255, 101, 145, 103),
        onConfirmBtnTap: () async {
          Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
        },
      );
    } else {
      loginError();
    }
  }

  String _getHomeRoute(String role) {
    switch (role) {
      case 'WASTE_COLLECTOR':
        return '/waste_collector_home';
      case 'USER':
        return '/user_home';
      default:
        return '/login';
    }
  }

  void loginError() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: "Oops!",
      text: 'Incorrect username or password!',
      confirmBtnText: 'Try again',
      confirmBtnColor: const Color.fromARGB(255, 67, 78, 68),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/login1.JPG"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 100,
                    margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/qd.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      inputDecorationTheme: const InputDecorationTheme(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        onSaved: (value) {
                          _email = value!;
                        },
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return "Please Enter Email";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email)) return "Its not a valid Email";
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "User Email",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      inputDecorationTheme: const InputDecorationTheme(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        onSaved: (value) {
                          _password = value!;
                        },
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return "Please Enter password";
                          }
                          return null;
                        },
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          sendUser();
                        } else {
                          print('not valid form');
                          return;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        minimumSize: const Size(100, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Abadi',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 50, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/register_user');
                          },
                          child: const Text(
                            "Sign-up (User)",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                            width: 20), // Small gap between the buttons
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/register_waste');
                          },
                          child: const Text(
                            "Sign-up (WC)",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
