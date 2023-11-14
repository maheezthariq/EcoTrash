import 'package:flutter/material.dart';
// import 'package:flutter_application_1/MainPage.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/profile/profile.dart';
import 'package:flutter_application_1/WasteCollector/loginWC.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    child: const TextField(
                        decoration: InputDecoration(
                      hintText: "Username",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
                  child: const TextField(
                    obscureText: true, // added this line to hide the text
                    decoration: InputDecoration(
                      hintText: "Password",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Profile()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // changed the background color to transparent
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
                        fontFamily: 'Abadi', // added this line to change the font
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
    );
  }
}
