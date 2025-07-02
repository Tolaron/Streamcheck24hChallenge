import 'package:flutter/material.dart';

// Authentifizierungsbildschirm mit TabBar
class AuthScreen extends StatefulWidget
{
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin
{
  late TabController _tabController;

  // Form Keys für Validierung
  final _loginFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();

  // Textfeld-Controller
  final _loginEmailController = TextEditingController();
  final _registerEmailController = TextEditingController();
  final _registerUsernameController = TextEditingController();

  @override
  void initState()
  {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose()
  {
    _tabController.dispose();
    _loginEmailController.dispose();
    _registerEmailController.dispose();
    _registerUsernameController.dispose();
    super.dispose();
  }

  // Login-Formular
  Widget _buildLoginForm() {
    return Form(
      key: _loginFormKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _loginEmailController,
              decoration: const InputDecoration(labelText: 'E-Mail'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'E-Mail erforderlich';
                if (!value.contains('@')) return 'Ungültige E-Mail';
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_loginFormKey.currentState!.validate()) {
                  // Aktion später in Ticket 3.1
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login erfolgreich (Simuliert)')),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  // Register-Formular
  Widget _buildRegisterForm() {
    return Form(
      key: _registerFormKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _registerUsernameController,
              decoration: const InputDecoration(labelText: 'Benutzername'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Benutzername erforderlich';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _registerEmailController,
              decoration: const InputDecoration(labelText: 'E-Mail'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'E-Mail erforderlich';
                if (!value.contains('@')) return 'Ungültige E-Mail';
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_registerFormKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registrierung erfolgreich (Simuliert)')),
                  );
                }
              },
              child: const Text('Registrieren'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event App Anmeldung'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Login'),
            Tab(text: 'Registrieren'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildLoginForm(),
          _buildRegisterForm(),
        ],
      ),
    );
  }
}