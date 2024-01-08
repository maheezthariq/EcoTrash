import 'package:flutter/material.dart';

class ReportWC extends StatefulWidget {
  const ReportWC({Key? key}) : super(key: key);

  @override
  _ReportWCState createState() => _ReportWCState();
}

class _ReportWCState extends State<ReportWC>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isLocationOn = false;

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
        backgroundColor: Colors.green,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Requested'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // First tab content
          Container(
            child: Column(
              children: [
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.5),
                    // borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text(
                              "Location:",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(60, 5, 0, 0),
                            child: Text(
                              "Trincomalee",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic, // Add italic style
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
              alignment: Alignment.topCenter, // Align to the top center
              child: Switch(
                value: isLocationOn,
                onChanged: (value) {
                  setState(() {
                    isLocationOn = value;
                  });
                        },
                      ),
                  )],
                  ),
                ),
              ],
            ),
          ),
          // Second tab content
          const Center(
            child: Text('Tab 2 content'),
          ),
        ],
      ),
    );
  }
}
