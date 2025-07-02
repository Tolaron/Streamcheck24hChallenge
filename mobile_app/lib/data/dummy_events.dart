import '../models/event.dart';

// Statische Liste von Events zur UI-Vorschau
final dummyEvents = [
  Event(
    id: '1',
    title: 'Flutter Conference',
    description: 'Ein Tag voller spannender Flutter-Vorträge.',
    date: DateTime.now().add(Duration(days: 3)),
    location: 'Berlin',
  ),
  Event(
    id: '2',
  title: 'Streamcheck Hackathon',
  description: 'Entwickle das Event-System in 24h!',
  date: DateTime.now().add(Duration(days: 7)),
  location: 'Hamburg',
  ),
  Event(
  id: '3',
  title: 'Meetup: Clean Code',
  description: 'Austausch mit anderen Entwicklern über Best Practices.',
  date: DateTime.now().add(Duration(days: 14)),
  location: 'Online',
  ),
];
