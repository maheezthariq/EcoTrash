import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 26, 2).withOpacity(0.6),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 30, 0, 0),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(120, 50, 120, 0),
            child: Image.asset(
              'Chair.jpg',
              alignment: Alignment.center,
              height: height * 0.4,
              width: width * 0.8,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Product Name : Chair",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Product Condition : Old",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 10, 0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Product Description : Used chair available in my home\nKatubedda. Computer chair in well condition. \nCall me for more details\n',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
              height: 2,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                    // show mobile keypad
                    FocusScope.of(context).requestFocus(FocusNode());
                    SystemChannels.textInput.invokeMethod('TextInput.show');
                  },
                  child:
                      Text('Call Now', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
