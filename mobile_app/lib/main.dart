import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/event_screen.dart';
import 'screens/auth_screen.dart';

void main() {
  runApp(const EventApp());
}

class EventApp extends StatelessWidget {
  const EventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      initialRoute: '/auth',
      routes: {
        '/': (context) => const HomeScreen(),
        '/event': (context) => const EventScreen(),
        '/auth': (context) => const AuthScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
