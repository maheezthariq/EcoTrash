import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/resell/resellmain.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String _location = '';
  File? _image;

  Future<void> _fetchLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final place = placemarks.first;
    setState(() {
      _location =
          '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
    });
  }

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

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
              margin: EdgeInsets.fromLTRB(20, 120, 120, 0),
              child: Text(
                "REPORT",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(22, 30, 0, 0),
              child: Text("Problem Description",
                  style: TextStyle(
                      fontSize: 15,
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
                  hintText: "Briefly type your problem you identify",
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ))),
            Container(
              margin: const EdgeInsets.fromLTRB(130, 20, 0, 0),
              child: ElevatedButton(
                onPressed: _fetchLocation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 1, 17, 1),
                  minimumSize: const Size(100, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                child: const Text("Fetch Location",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Abadi', // added this line to change the font
                    )),
              ),
            ),
            if (_location.isNotEmpty)
              // Container(
              //   margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              //   child: Text(
              //     'Location: $_location',
              //     style: const TextStyle(
              //       fontSize: 15,
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    _location.isNotEmpty ? 'Location: $_location' : 'Location',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            Container(
              margin: EdgeInsets.fromLTRB(300, 40, 0, 0),
              height: 50,
              child: FloatingActionButton(
                child: const Icon(Icons.add_a_photo),
                backgroundColor: Color.fromARGB(255, 6, 243, 184),
                onPressed: _getImage,
                tooltip: 'Add Image',
              ),
            ),
            if (_image != null)
              Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.file(
                  _image!,
                  fit: BoxFit.cover,
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
