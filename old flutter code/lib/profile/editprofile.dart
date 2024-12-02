import 'package:flutter/material.dart';
import 'profile.dart';

class Editprofile extends StatelessWidget {
  const Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Profile(),
              ),
            );
          },
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(100, 15, 100, 0),
              child: Stack(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      // child: const Image(image: AssetImage(sith)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt_rounded,
                            color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: const TextField(
                decoration: InputDecoration(
                  label: Text(
                    "Full Name",
                    style: TextStyle(),
                  ),
                  prefixIcon:
                      Icon(Icons.account_circle_rounded, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: const TextField(
                decoration: InputDecoration(
                  label: Text(
                    "E-mail",
                    style: TextStyle(),
                  ),
                  prefixIcon: Icon(Icons.email_rounded, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: const TextField(
                decoration: InputDecoration(
                  label: Text(
                    "Phone No",
                    style: TextStyle(),
                  ),
                  prefixIcon: Icon(Icons.phone, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: const TextField(
                decoration: InputDecoration(
                  label: Text(
                    "Password",
                    style: TextStyle(),
                  ),
                  prefixIcon: Icon(Icons.password_rounded, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
