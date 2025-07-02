import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _loginFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();

  final _loginEmailController = TextEditingController();
  final _registerEmailController = TextEditingController();
  final _registerUsernameController = TextEditingController();

  final _authService = AuthService(ApiClient(baseUrl: 'http://10.0.2.2:8080')); // Emulator-Adresse

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _loginEmailController.dispose();
    _registerEmailController.dispose();
    _registerUsernameController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _handleLogin() async {
    if (!_loginFormKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final error = await _authService.login(_loginEmailController.text.trim());
    setState(() => _isLoading = false);

    if (error == null) {
      Navigator.pushReplacementNamed(context, '/');
    } else {
      _showMessage('Fehler: $error');
    }
  }

  Future<void> _handleRegister() async {
    if (!_registerFormKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final error = await _authService.register(
      _registerUsernameController.text.trim(),
      _registerEmailController.text.trim(),
      'PARTICIPANT',
    );
    setState(() => _isLoading = false);

    if (error == null) {
      _showMessage('Registrierung erfolgreich');
      _tabController.animateTo(0);
    } else {
      _showMessage('Fehler: $error');
    }
  }

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
              onPressed: _isLoading ? null : _handleLogin,
              child: _isLoading ? const CircularProgressIndicator() : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

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
              onPressed: _isLoading ? null : _handleRegister,
              child: _isLoading ? const CircularProgressIndicator() : const Text('Registrieren'),
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
