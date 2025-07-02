import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/event_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/event_list_screen.dart';
import 'screens/create_event_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/main_navigation_screen.dart';

void main() {
  runApp(const EventApp());
}

class EventApp extends StatelessWidget {
  const EventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainNavigationScreen(),
        '/auth': (context) => const AuthScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
