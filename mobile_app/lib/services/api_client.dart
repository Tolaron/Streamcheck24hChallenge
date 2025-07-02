import 'dart:convert';

import 'package:http/http.dart' as http;

// Klasse für generische HTTP-Requests
class ApiClient {
  late final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<http.Response> get(String endpoint) async
  {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.get(url);
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }
}