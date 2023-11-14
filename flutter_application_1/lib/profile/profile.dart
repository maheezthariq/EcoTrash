import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/resell/resellmain.dart';
import 'editprofile.dart';
import 'profilewidget.dart';
import 'package:flutter_application_1/report.dart';
import 'package:flutter_application_1/MainPage.dart';
import 'package:flutter_application_1/Tracking/Tracking.dart';
// import 'package:flutter_application_1/WasteCollector/ReportWC.dart';

class Profile extends StatefulWidget {
  const Profile({super.key}); // Use 'Key?' instead of 'super.key'

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 2;

  final tabs = [
    const Resell(),
    const Report(),
    const MainPage(),
    const TrackingPage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.white,
      body: _currentIndex == 4
          ? Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage('maheez.png')),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt_rounded,
                              color: Colors.black),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: const Text(
                    "MAHEEZ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Editprofile(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 135, 165, 163),
                      minimumSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Divider(),
                ProfileWidget(
                  icon: Icons.settings,
                  title: "Settings",
                  onPress: () {},
                  endIcon: true, // Set 'endIcon' to true
                ),
                ProfileWidget(
                  icon: Icons.chat_bubble,
                  title: "FAQ",
                  onPress: () {},
                  endIcon: true, // Set 'endIcon' to true
                ),
                ProfileWidget(
                  icon: Icons.logout_outlined,
                  title: "Logout",
                  onPress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  endIcon: true,
                  textColor: Colors.red, // Set text color to red
                ),
              ],
            ))
          : tabs[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.green.shade100,
          backgroundColor: Color.fromARGB(255, 1, 70, 4),
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Color.fromARGB(240, 3, 158, 42),
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          animationDuration: const Duration(milliseconds: 500),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 50,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.add_to_drive_outlined),
              selectedIcon: Icon(Icons.add_to_drive_outlined),
              label: 'Resell',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_off_outlined),
              selectedIcon: Icon(Icons.search_off_outlined),
              label: 'Report',
            ),
            NavigationDestination(
              icon: Icon(Icons.home_max),
              selectedIcon: Icon(Icons.home_max),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.track_changes_outlined),
              selectedIcon: Icon(Icons.track_changes_outlined),
              label: 'Tracking',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_sharp),
              selectedIcon: Icon(Icons.account_circle_sharp),
              label: 'Profile',
            ),
          ],
        ),
        // selectedItemColor: Colors.green.shade100,
        // unselectedItemColor: Colors.green,
        // items: const [
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.add_to_drive_outlined),
        //     label: 'Resell',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.search_off_outlined),
        //     label: 'Report',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.home_max),
        //     label: 'Home',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.track_changes_outlined),
        //     label: 'Tracking',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.account_circle_sharp),
        //     label: 'Profile',
        //   ),
        // ],
      ),
    );
  }
}
