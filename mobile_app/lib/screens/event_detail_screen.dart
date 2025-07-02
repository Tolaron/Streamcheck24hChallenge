import 'package:flutter/material.dart';

// Screen zur Anzeige der Event-Details (ohne echte Datenbindung)
class EventDetailScreen extends StatelessWidget {
  final Map<String, dynamic> event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event['description'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text('Datum: ${event['date']}'),
            Text('Ort: ${event['location']}'),
            Text('Maximale Teilnehmer: ${event['maxParticipants']}'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Noch keine Logik – wird in Ticket 3.1 ergänzt
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Anmeldefunktion folgt…')),
                  );
                },
                child: const Text('Anmelden'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
