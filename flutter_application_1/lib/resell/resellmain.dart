import 'package:flutter/material.dart';
import 'package:flutter_application_1/MainPage.dart';
import 'package:flutter_application_1/resell/addproduct.dart';
import 'package:flutter_application_1/resell/description.dart';

class Resell extends StatelessWidget {
  const Resell({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 26, 2).withOpacity(0.6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 8, 26, 2).withOpacity(0.6),
        title: Text(
          'Eco Seller',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const MainPage()),
                  );})
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // First SingleChildScrollView

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) =>
                  const ProductPage()
                  ),
                );
              },
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
                    height: 350,
                    child: Container(
                        child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 300,
                          height: 200,
                          child: Image.asset(
                            'Chair.jpg',
                            alignment: Alignment.center,
                            // height: 20,
                            // width: 10,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 60,0 , 0),
                          child: const Text(
                            "Product Name: Chair ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: const Text(
                            "Product Condition : Old",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
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
              onTap: () {
                
              },
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
                    height: 350,
                    child: Container(
                        child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 300,
                          height: 200,
                          child: Image.asset(
                            'Fan.jpg',
                            alignment: Alignment.center,
                            // height: 20,
                            // width: 10,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 60,0 , 0),
                          child: const Text(
                            "Product Name: Fan ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: const Text(
                            "Product Condition : Old",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
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
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (BuildContext context) =>
                //   const EcoSeller()
                //   ),
                // );
              },
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
                    height: 350,
                    child: Container(
                        child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 300,
                          height: 200,
                          child: Image.asset(
                            'Chair.jpg',
                            alignment: Alignment.center,
                            // height: 20,
                            // width: 10,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 60,0 , 0),
                          child: const Text(
                            "Product Name: Chair ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: const Text(
                            "Product Condition : Old",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
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
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (BuildContext context) =>
                //   const EcoSeller()
                //   ),
                // );
              },
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
                    height: 350,
                    child: Container(
                        child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 300,
                          height: 200,
                          child: Image.asset(
                            'Chair.jpg',
                            alignment: Alignment.center,
                            // height: 20,
                            // width: 10,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 60,0 , 0),
                          child: const Text(
                            "Product Name: Chair ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: const Text(
                            "Product Condition : Old",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
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
          child: Icon(Icons.add_box_rounded),
          backgroundColor: Color.fromARGB(223, 24, 233, 66),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const AddProduct()),
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
