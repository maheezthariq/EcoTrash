import 'package:flutter/material.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Bin Details'),
        backgroundColor: Colors.green, // Added this line to change the app bar color to green
      ),
      backgroundColor: const Color.fromARGB(255, 2, 33, 3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bin ID: 1234',
              style: TextStyle(
              color: Colors.white,
              fontSize: 12
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bin Location: XYZ Street',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12
                ),
            ),
            SizedBox(height: 16),
            Text(
              'Bin Status: Full',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12
                ),
            ),
            Container(
                      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      width: 200,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size(200, 50), // Button size
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)), // Button border radius
                          ),
                        ),
                        child: const Text("Request Waste Pickup",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
