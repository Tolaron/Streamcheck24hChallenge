// definiert die event-datenstruktur
class Event
{
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String location;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
  });

  // JSON → Event
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'].toString(), // ID als String erzwingen
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      location: json['location'],
    );
  }

  // Event → JSON (für create)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'location': location,
    };
  }
}