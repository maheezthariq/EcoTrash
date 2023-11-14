import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? _userRole = 'Citizen';

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
            // Container(
            //   margin: EdgeInsets.fromLTRB(0, 30, 160, 0),
            //   child: Text("CREATE ACCOUNT",
            //       style: TextStyle(
            //           fontSize: 20,
            //           color: Colors.white,
            //           letterSpacing: 1,
            //           fontWeight: FontWeight.bold)),
            // ),
            // Container(
            //   margin: EdgeInsets.fromLTRB(0, 20, 260, 0),
            //   child: Text("User Role",
            //       style: TextStyle(
            //           fontSize: 16,
            //           color: Colors.white,
            //           letterSpacing: 1,
            //           fontWeight: FontWeight.bold)),
            // // ),
            // Container(
            //   margin: const EdgeInsets.fromLTRB(20, 2, 20, 0),
            //   height: 50,
            //   child: Row(
            //     children: [
            //       Radio<String>(
            //         value: 'Citizen',
            //         groupValue: _userRole,
            //         onChanged: (String? value) {
            //           setState(() {
            //             _userRole = value;
            //           });
            //         },
            //       ),
            //       const Text("Citizen",
            //           style: TextStyle(
            //               fontSize: 14, color: Colors.white, letterSpacing: 1)),
            //       const SizedBox(width: 30),
            //       Radio<String>(
            //         value: 'Waste Collector',
            //         groupValue: _userRole,
            //         onChanged: (String? value) {
            //           setState(() {
            //             _userRole = value;
            //           });
            //         },
            //       ),
            //       const Text('Waste Collector',
            //           style: TextStyle(
            //               fontSize: 14, color: Colors.white, letterSpacing: 1)),
            //     ],
            //   ),
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 260, 0),
              child: Text("Full Name",
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
                child: const TextField(
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
                child: const TextField(
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
                child: const TextField(
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
                child: const TextField(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Login()),
                  );
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
