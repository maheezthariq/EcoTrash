import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eco_trash/services/eco_trash_db_service.dart';
import 'package:eco_trash/models/user_model.dart';

class AuthService {
  final String baseUrl = 'http://192.168.8.137:3020';

  Future<void> login(String email, String password) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
      Uri.parse('$baseUrl/public/login'),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print(responseData.toString());
      final user = User(
        id: responseData['_id'],
        name: responseData['name'],
        role: responseData['role'],
        email: responseData['email'],
        token: responseData['token'],
      );
      await EcoTrashDBService.instance.insertUser(user.toMap());
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> registerUser(String name, String email, String password) async {
    await _register(name, email, password, 'USER');
  }

  Future<void> registerWasteCollector(
      String name, String email, String password) async {
    await _register(name, email, password, 'WASTE_COLLECTOR');
  }

  Future<void> _register(
      String name, String email, String password, String role) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
    };

    final response = await http.post(
      Uri.parse('$baseUrl/public/register'),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print("registered successfully");
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<void> logout() async {
    await EcoTrashDBService.instance.deleteUser();
  }
}
