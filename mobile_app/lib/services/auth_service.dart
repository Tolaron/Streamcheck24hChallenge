import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_client.dart';

class AuthService {
  final ApiClient _client;

  AuthService(this._client);

  Future<String?> register(String username, String email, String role) async {
    final response = await _client.post('/api/users/register', {
      'username': username,
      'email': email,
      'role': role,
    });

    if (response.statusCode == 200) {
      return null; // Erfolg
    } else {
      return jsonDecode(response.body)['message'] ?? 'Fehler bei der Registrierung';
    }
  }

  Future<String?> login(String email) async {
    final response = await _client.post('/api/users/login', {
      'email': email,
    });

    if (response.statusCode == 200) {
      return null; // Erfolg
    } else {
      return jsonDecode(response.body)['message'] ?? 'Fehler beim Login';
    }
  }
}
