import 'package:flutter/material.dart';

class ReportWC extends StatefulWidget {
  const ReportWC({Key? key}) : super(key: key);
  
  @override
  _ReportWCState createState() => _ReportWCState();
}

class _ReportWCState extends State<ReportWC> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
        backgroundColor: Colors.green,        
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Requested'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // First tab content
          Center(
            child: Text('Tab 1 content'),
          ),
          // Second tab content
          Center(
            child: Text('Tab 2 content'),
          ),
        ],
      ),
    );
  }
}
