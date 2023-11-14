import 'package:flutter/material.dart';
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
  String? repassword;
  String? mobile;

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
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('qd.png'), fit: BoxFit.cover),
              ),
            ),

          
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 260, 0),
                child: Text("Full Name",
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
                    decoration: InputDecoration(
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
              margin: EdgeInsets.fromLTRB(0, 30, 260, 0),
              child: Text("Username",
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
                                return "Name can't be empty";
                              }
                              return null;
                            },
                            onSaved: (text) {
                              name = text;
                            },
                    decoration: InputDecoration(
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
              margin: EdgeInsets.fromLTRB(0, 30, 300, 0),
              child: Text("Email",
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
                    decoration: InputDecoration(
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
              margin: EdgeInsets.fromLTRB(0, 30, 260, 0),
              child: Text("Password",
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
                  decoration: InputDecoration(
                    hintText: "Enter a valid password here",
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                //  Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => Login()),
                //   );

                 if (_formKey.currentState!.validate()) {
                                print('valid form');
                                _formKey.currentState!.save();

                                sendUser();
                              } else {
                                print('not valid form');
                                return;
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
