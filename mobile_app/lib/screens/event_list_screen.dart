import 'package:flutter/material.dart';
import '../data/dummy_events.dart';
import '../models/event.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  late List<Event> _events;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _events = dummyEvents;                                  // Dummy-Daten initial laden
  }

  Future<void> _refreshEvents() async {
    setState(() => _isRefreshing = true);
    await Future.delayed(const Duration(seconds: 1));       // simuliert Ladevorgang
    setState(() {
      // In Realität: API-Call hier
      _events = List<Event>.from(dummyEvents);              // Dummy-Daten erneut laden
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eventliste')),
      body: RefreshIndicator(
        onRefresh: _refreshEvents,
        child: ListView.builder(
          itemCount: _events.length,
          itemBuilder: (context, index) {
            final event = _events[index];
            return ListTile(
              title: Text(event.title),
              subtitle: Text('${event.location} – ${event.date.toLocal().toString().split(' ')[0]}'),
              onTap: () {
                // später: Navigation zu Detail
              },
            );
          },
        ),
      ),
    );
  }
}
