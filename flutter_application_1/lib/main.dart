import 'package:flutter/material.dart';
import 'package:flutter_application_1/getstart.dart';
// import 'report.dart';
// import 'profile/profile.dart';
import 'package:device_preview/device_preview.dart';
// import 'package:flutter_application_1/navigationbar.dart';
import 'package:flutter_application_1/resell/addproduct.dart';
// import 'package:flutter_application_1/navigate.dart';
import 'package:flutter_application_1/report.dart';
import 'package:flutter_application_1/Tracking/example.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecotrsh',
      home: GetStart(),
      // home: const Report(),
      // home: const GeolocatorWidget(),
      // home: Navigate(),
      // home: MaterialYou(),
      // home: AddProduct(),

      // routes: {
      //   '/navigationbar': (context) => const MaterialYou(),
      // '/navigatio': (context) => const Profile(),
      // '/report': (context) => const Report(),
      // },
    );
  }
}
