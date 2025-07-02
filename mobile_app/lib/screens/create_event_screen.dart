import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controller für Textfelder
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _maxParticipantsController = TextEditingController();

  DateTime? _selectedDate;

  // Zeigt den DatePicker an
  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Validiert und speichert das Formular
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bitte ein Datum auswählen')),
        );
        return;
      }

      // Erfolgssimulation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Event erstellt')),
      );

      // Optional: Felder leeren
      _formKey.currentState!.reset();
      _selectedDate = null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Event erstellen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Titel
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Titel'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Pflichtfeld' : null,
              ),

              // Beschreibung
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Beschreibung'),
                maxLines: 3,
              ),

              // Datum
              ListTile(
                title: Text(_selectedDate == null
                    ? 'Kein Datum gewählt'
                    : DateFormat('dd.MM.yyyy').format(_selectedDate!)),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickDate,
              ),

              // Ort
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Ort'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Pflichtfeld' : null,
              ),

              // Max. Teilnehmer
              TextFormField(
                controller: _maxParticipantsController,
                decoration: const InputDecoration(
                    labelText: 'Maximale Teilnehmeranzahl'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Pflichtfeld';
                  final number = int.tryParse(value);
                  if (number == null || number <= 0) {
                    return 'Ungültige Zahl';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Event erstellen'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
