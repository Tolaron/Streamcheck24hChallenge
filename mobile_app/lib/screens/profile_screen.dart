import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy-Daten
    final userName = 'Max Mustermann';
    final userEmail = 'max@example.com';
    final createdEvents = ['Flutter Workshop', 'Hackathon 2025'];
    final registeredEvents = ['React Meetup', 'AI Symposium'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Benutzerdaten',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(userName),
              subtitle: const Text('Benutzername'),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(userEmail),
              subtitle: const Text('E-Mail'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Erstellte Events',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...createdEvents.map((event) => ListTile(
              leading: const Icon(Icons.event),
              title: Text(event),
            )),
            const SizedBox(height: 24),
            const Text(
              'Registrierte Events',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...registeredEvents.map((event) => ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text(event),
            )),
          ],
        ),
      ),
    );
  }
}
