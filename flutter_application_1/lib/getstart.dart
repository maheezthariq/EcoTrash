import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class GetStart extends StatelessWidget {
  const GetStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(120, 300, 120, 0),
              child: Image.asset(
                'qd.png',
                height: 140,
                width: 140,
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 100, 10, 0),
                height: 5,
                color: Colors.white,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                height: 5,
                color: Colors.white,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                height: 5,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
              height: 50,
              child: Center(
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: FloatingActionButton(
                      backgroundColor:
                          Color.fromARGB(248, 45, 51, 47).withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const Login()),
                        );
                      },
                      child: Text(
                        'GET START',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}