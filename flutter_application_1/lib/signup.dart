import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:flutter_application_1/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool passtoggle = true;
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? userName;

  void sendUser() async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json', // Set the content type
      };
      final Map<String, dynamic> data = {
        "name": name,
        "email": email,
        "userName": userName,
        "password": password,
        "profile_pic": ""
      };

      final response = await http.post(
        Uri.parse('http://localhost:5000/api/v1/Signup'),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        debugPrint('Registered successfully');
        debugPrint(response.body);
        RegistrationConfirm();
      } else {
        debugPrint('Failed to send POST request ${response.statusCode}');
        RegistrationError();
      }
    } catch (er) {
      debugPrint(er.toString());
    }
  }

  void RegistrationConfirm() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: "Registration",
      text: 'Successfull!',
      confirmBtnText: 'Continue',
      confirmBtnColor: const Color.fromARGB(255, 101, 145, 103),
      onConfirmBtnTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
    );
  }

  void RegistrationError() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: "Oops!",
      text: 'Sorry, Email & Mobile should be unique!',
      confirmBtnText: 'Try again',
      confirmBtnColor: const Color.fromARGB(255, 67, 78, 68),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('login1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        // child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 100,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('qd.png'), fit: BoxFit.cover),
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 260, 0),
                child: const Text("Full Name",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Name can't be empty";
                      }
                      return null;
                    },
                    onSaved: (text) {
                      name = text;
                    },
                    onChanged: (text) {
                    name = text;
                  },
                    decoration: const InputDecoration(
                      hintText: "Enter your name here",
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ))),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 260, 0),
              child: const Text("Username",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "UserName can't be empty";
                      }
                      return null;
                    },
                    onSaved: (text) {
                      userName = text;
                    },
                    onChanged: (text) {
                    userName = text;
                  },
                    decoration: const InputDecoration(
                      hintText: "Enter a valid username here",
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ))),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 300, 0),
              child: const Text("Email",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Email can't be empty";
                      }
                      return null;
                    },
                    onSaved: (text) {
                      email = text;
                    },
                    onChanged: (text) {
                    email = text;
                  },
                    decoration: const InputDecoration(
                      hintText: "Enter a valid email address here",
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ))),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 260, 0),
              child: const Text("Password",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                  onSaved: (text) {
                    password = text;
                  },
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: passtoggle,
                  decoration: InputDecoration(
                    hintText: "Enter a valid password here",
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passtoggle ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          passtoggle = !passtoggle;
                        });
                      },
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    sendUser();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 1, 17, 1),
                  minimumSize: const Size(100, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                child: const Text("SIGN UP",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Abadi', // added this line to change the font
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
