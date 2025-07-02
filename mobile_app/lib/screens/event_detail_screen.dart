import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget
{
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text('Event Details')),
      body: Center(child: Text('Details zum Event')),
    );
  }
}