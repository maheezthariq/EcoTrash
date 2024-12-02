import 'package:flutter/material.dart';

class WasteCollectorHomeScreen extends StatefulWidget {
  const WasteCollectorHomeScreen({super.key});

  @override
  State<WasteCollectorHomeScreen> createState() =>
      _WasteCollectorHomeScreenState();
}

class _WasteCollectorHomeScreenState extends State<WasteCollectorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Waste collector Home')),
      body: Center(child: Text('waste ')),
    );
  }
}
