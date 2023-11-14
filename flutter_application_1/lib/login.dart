import 'package:flutter/material.dart';
// import 'package:flutter_application_1/MainPage.dart';
import 'dart:convert';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/profile/profile.dart';
import 'package:flutter_application_1/WasteCollector/loginWC.dart';
import 'package:quickalert/quickalert.dart';
// import 'path_to_your_file.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void loginUser() async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json', // Set the content type
      };
      final Map<String, dynamic> data = {
        "email": _email,
        "password": _password,
      };

      final response = await http.post(
        Uri.parse('http://localhost:7000/api/login'),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print('Login successfully');
        print(response.body);
        LoginConfirm();
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/userHome', (route) => false);
        });
      } else {
        print('Failed to send POST request ${response.statusCode}');
        LoginError();
      }
    } catch (er) {
      print(er);
    }
  }

  void LoginConfirm() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: "Login",
      text: 'Successfull!',
      confirmBtnText: 'Continue',
      confirmBtnColor: const Color.fromARGB(255, 101, 145, 103),
      onConfirmBtnTap: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      },
    );
  }

  void LoginError() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: "Oops!",
      text: 'Incorrect username or password!',
      confirmBtnText: 'Try again',
      confirmBtnColor: Color.fromARGB(255, 67, 78, 68),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("login1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 100,
                    margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('qd.png'), fit: BoxFit.cover),
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      inputDecorationTheme: InputDecorationTheme(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(80, 40, 80, 0),
                        height: 50,
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
                                  .hasMatch(email))
                                return "Its not a valid Email";
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Username",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.transparent,
                              enabledBorder: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              prefixIcon: Icon(Icons.person),
                            ))),
                  ),
                  Theme(
                    data: ThemeData(
                      inputDecorationTheme: InputDecorationTheme(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(80, 15, 80, 0),
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
                        obscureText: true, // added this line to hide the text
                        decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    //width: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (BuildContext context) =>
                        //           const Profile()),
                        // );

                         if (_formKey.currentState!.validate()) {
                                print('valid form');
                                formKey.currentState!.save();

                                sendUser();
                              } else {
                                print('not valid form');
                                return;
                              }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .transparent, // changed the background color to transparent
                        minimumSize: const Size(100, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      child: const Text("LOGIN",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                'Abadi', // added this line to change the font
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 50, 0, 0),
                    child: Row(
                      children: <Widget>[
                        TextButton(
                            onPressed: () {},
                            child: const Text("Forgot password?",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ))),
                        Container(
                            margin: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Signup()),
                                  );
                                },
                                child: const Text("Sign Up",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ))))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginWC()),
                        );
                        // Add your link here
                      },
                      child: const Text(
                        "Are you a waste collector? Click here",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
