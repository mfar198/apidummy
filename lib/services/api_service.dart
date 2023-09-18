import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://reqres.in/api';

  static Future<Map<String, dynamic>> loginUser(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'email': email, 'password': password},
    );

    return json.decode(response.body);
  }

  static Future<Map<String, dynamic>> registerUser(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: {'email': email, 'password': password},
    );

    return json.decode(response.body);
  }

  static Future<Map<String, dynamic>> getUserList() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    return json.decode(response.body);
  }
}
