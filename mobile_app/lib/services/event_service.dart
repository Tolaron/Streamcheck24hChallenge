import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';

// Service für HTTP-Kommunikation mit dem Event-Backend
class EventService {
  final String baseUrl;

  EventService({required this.baseUrl});

  // Alle Events abrufen
  Future<List<Event>> fetchEvents() async {
    final response = await http.get(Uri.parse('$baseUrl/api/events'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Event.fromJson(json)).toList();
    } else {
      throw Exception('Fehler beim Abrufen der Events: ${response.statusCode}');
    }
  }

  // Einzelnes Event anhand der ID abrufen
  Future<Event> fetchEventById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/api/events/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      return Event.fromJson(jsonMap);
    } else {
      throw Exception('Event mit ID $id nicht gefunden: ${response.statusCode}');
    }
  }

  // Neues Event erstellen
  Future<void> createEvent(Event event) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/events'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': event.title,
        'description': event.description,
        'date': event.date.toIso8601String(),
        'location': event.location,
      }),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception('Event konnte nicht erstellt werden: ${response.statusCode}');
    }
  }

  // Event löschen
  Future<void> deleteEvent(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/api/events/$id'));

    if (response.statusCode != 204 && response.statusCode != 200) {
      throw Exception('Event konnte nicht gelöscht werden: ${response.statusCode}');
    }
  }
}
