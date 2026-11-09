import 'package:flutter/material.dart';
import 'auth_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // A list of records: (icon, title, text)
    final steps = [
      (
        Icons.search,
        '1. List Medications',
        'Enter all the medicines your loved one takes.',
      ),
      (
        Icons.gpp_maybe,
        '2. Check Interactions',
        'MedGuard compares every pair using the National Library of Medicine.',
      ),
      (
        Icons.auto_awesome,
        '3. Get a Simple Report',
        'Gemini explains the risks in plain language and suggests questions for the doctor.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('MedGuard')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/medicine.png', height: 120),
            const SizedBox(height: 20),
            const Text(
              'Protect Your Loved Ones From Dangerous Drug Interactions',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'When managing multiple prescriptions from different doctors, dangerous interactions can go unnoticed. MedGuard checks them and gives you immediate, plain-language risk alerts.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthScreen()),
                );
              },
              child: const Text('Start Free Analysis'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Scroll down to see how it works'),
                  ),
                );
              },
              child: const Text('Learn More'),
            ),
            const SizedBox(height: 30),
            const Text(
              'How It Works',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            for (final step in steps)
              Card(
                child: ListTile(
                  leading: Icon(step.$1, color: Colors.teal),
                  title: Text(step.$2),
                  subtitle: Text(step.$3),
                ),
              ),
            const SizedBox(height: 20),
            const Text(
              'Not a substitute for professional medical advice.\n© 2026 MedGuard',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
