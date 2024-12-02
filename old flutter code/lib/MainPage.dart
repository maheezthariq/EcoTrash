import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/profile/editprofile.dart';
import 'package:flutter_application_1/profile/faq.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 83, 45).withOpacity(0.6),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  const Color.fromARGB(255, 0, 0, 0),
                  const Color.fromARGB(240, 3, 158, 42),
                  const Color.fromARGB(255, 0, 0, 0),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Center(
                child: ListTile(
                    title: const Text(
                      'Welcome',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const Editprofile(),
                          ),
                        );
                      },
                    )),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(129, 255, 255, 255),
                    contentPadding: EdgeInsets.all(15),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 450,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 1),
                initialPage: 1,
              ),
              items: [
                // First Image Stack
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => const LongPressPage(),
                    //   ),
                    // );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 450,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('assets/qd.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                // Second Image Stack
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => const longPressPage(),
                    //   ),
                    // );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 450,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('assets/qd.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => const longPressPage(),
                    //   ),
                    // );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 450,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('assets/qd.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                alignment: Alignment.center,
                child: SingleChildScrollViewExample(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.white),
                        color: const Color.fromARGB(255, 0, 0, 0)
                            .withOpacity(0.4)),
                    // color: const Color.fromARGB(255, 165, 184, 199),
                    height: 150,
                    width: 500,
                    child: Container(
                        child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'Recycle.png',
                            alignment: Alignment.topLeft,
                            // height: 20,
                            // width: 10,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 120, 0),
                          child: const Text(
                            "Recycle Tip 1 ",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w200,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                alignment: Alignment.center,
                child: SingleChildScrollViewExample(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.white),
                        color: const Color.fromARGB(255, 0, 0, 0)
                            .withOpacity(0.4)),
                    // color: const Color.fromARGB(255, 165, 184, 199),
                    height: 150,
                    width: 500,
                    child: Container(
                        child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'Recycle.png',
                            alignment: Alignment.topLeft,
                            // height: 20,
                            // width: 10,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 120, 0),
                          child: const Text(
                            "Recycle Tip 2 ",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w200,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                alignment: Alignment.center,
                child: SingleChildScrollViewExample(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.white),
                        color: const Color.fromARGB(255, 0, 0, 0)
                            .withOpacity(0.4)),
                    // color: const Color.fromARGB(255, 165, 184, 199),
                    height: 150,
                    width: 500,
                    child: Container(
                        child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'Recycle.png',
                            alignment: Alignment.topLeft,
                            // height: 20,
                            // width: 10,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 120, 0),
                          child: const Text(
                            "Recycle Tip 3 ",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w200,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.chat),
          backgroundColor: Color.fromARGB(52, 239, 243, 11),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FAQPage()),
            );
          }),
    );
  }
}

class SingleChildScrollViewExample extends StatelessWidget {
  final Widget child;

  SingleChildScrollViewExample({required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: child,
    );
  }
}
