import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Bin Detail'),
        backgroundColor: Colors
            .green, // Added this line to change the app bar color to green
      ),
      backgroundColor: Color.fromARGB(255, 200, 202, 200),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
                zoom: 14,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('bin'),
                  position: LatLng(37.42796133580664, -122.085749655962),
                  infoWindow: InfoWindow(title: 'Bin Details'),
                ),
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(
                0, 0, 0, 0), // Adjusted margin top value to 20
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
              child: const Text(
                "Request Waste Pickup",
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
    );
  }
}
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_html/flutter_html.dart';

// class TrackingPage extends StatelessWidget {
//   const TrackingPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bin Details'),
//         backgroundColor: Colors.green,
//       ),
//       body: Html(
//         data: """
//         <iframe
//           width="600"
//           height="450"
//           style="border:0"
//           loading="lazy"
//           allowfullscreen
//           src="https://www.google.com/maps/embed/v1/place?key=YOUR_API_KEY&q=Space+Needle,Seattle+WA">
//         </iframe>
//         """,
//       ),
//     );
//   }
// }
