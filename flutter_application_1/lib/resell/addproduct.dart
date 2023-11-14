import 'package:flutter/material.dart';
import 'package:flutter_application_1/resell/resellmain.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? _product = 'New';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login1.jpg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        // child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 80, 120, 0),
              child: Text(
                "ADD PRODUCT",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 30, 190, 0),
              child: Text(
                "Full Name",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 10),
              height: 50,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Enter your full name here",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 10, 160, 0),
              child: const Text(
                "Product Name",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 10),
              height: 50,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Enter the Product name here",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 10, 160, 0),
              child: const Text(
                "Product Condition",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 2, 20, 0),
              height: 50,
              child: Row(
                children: [
                  Radio<String>(
                    value: 'New',
                    groupValue: _product,
                    onChanged: (String? value) {
                      setState(() {
                        _product = value;
                      });
                    },
                  ),
                  const Text("New",
                      style: TextStyle(
                          fontSize: 14, color: Colors.white, letterSpacing: 1)),
                  const SizedBox(width: 60),
                  Radio<String>(
                    value: 'Used',
                    groupValue: _product,
                    onChanged: (String? value) {
                      setState(() {
                        _product = value;
                      });
                    },
                  ),
                  const Text('Used',
                      style: TextStyle(
                          fontSize: 14, color: Colors.white, letterSpacing: 1)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 10, 145, 0),
              child: const Text(
                "Product Description",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 10),
              height: 50,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Add a brief description",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 10, 180, 0),
              child: const Text(
                "Enter your name here",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 10),
              height: 50,
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter a valid phone number here",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(300, 10, 0, 0),
              height: 50,
              child: FloatingActionButton(
                child: const Icon(Icons.add_a_photo),
                backgroundColor: Color.fromARGB(255, 6, 243, 184),
                onPressed: () async {
                  final pickedFile =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  // Do something with the picked image file
                },
                tooltip: 'Add Image',
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(160, 20, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Resell()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 1, 17, 1),
                  minimumSize: const Size(100, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                child: const Text("SUBMIT",
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
      // ),
    );
  }
}
