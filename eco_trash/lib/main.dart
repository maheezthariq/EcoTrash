import 'package:eco_trash/screens/public_screens/get_started_screen.dart';
import 'package:eco_trash/screens/public_screens/login_screen.dart';
import 'package:eco_trash/screens/public_screens/user_register_screen.dart';
import 'package:eco_trash/screens/public_screens/waste_collector_register_screen.dart';
import 'package:eco_trash/screens/user_screens/user_home_screen.dart';
import 'package:eco_trash/screens/waste_collector_screens/waste_collector_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:eco_trash/themes/themes.dart';
import 'package:eco_trash/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:eco_trash/services/eco_trash_db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = await EcoTrashDBService.instance.getUser();
  runApp(MyApp(user: user));
}

class MyApp extends StatelessWidget {
  final Map<String, dynamic>? user;

  const MyApp({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Eco Trash',
            debugShowCheckedModeBanner: false,
            theme: echoTrashTheme,
            darkTheme: echoTrashTheme,
            themeMode: ThemeMode.dark,
            initialRoute:
                user == null ? '/get_started' : _getHomeRoute(user!['role']),
            routes: {
              '/get_started': (context) => const GetStartedScreen(),
              '/login': (context) => LoginScreen(),
              '/register_waste': (context) => WasteCollectorRegisterScreen(),
              '/register_user': (context) => UserRegisterScreen(),
              '/waste_collector_home': (context) => WasteCollectorHomeScreen(),
              '/user_home': (context) => UserHomeScreen(),
              // '/dashboard': (context) => const DashboardScreen(),
            },
          );
        },
      ),
    );
  }

  String _getHomeRoute(String role) {
    switch (role) {
      case 'WASTE_COLLECTOR':
        return '/waste_collector_home';
      case 'USER':
        return '/user_home';
      default:
        return '/login';
    }
  }
}
