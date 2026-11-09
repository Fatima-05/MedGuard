import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'dashboard_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isSignUp = false;

  void submit() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }
    // Go to the dashboard and remove this screen from the back stack.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isSignUp ? 'Sign Up' : 'Sign In')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to MedGuard',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Sign in to check your medications.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: submit,
              child: Text(isSignUp ? 'Sign Up' : 'Sign In'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isSignUp = !isSignUp;
                });
              },
              child: Text(
                isSignUp
                    ? 'Already have an account? Sign In'
                    : 'New to MedGuard? Sign Up',
              ),
            ),
          ],
=======

import '../colors.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.slate200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome to MedGuard',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.slate900,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Sign in to check your medications.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: AppColors.slate500),
                ),
                const SizedBox(height: 24),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 14),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.teal600,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'New to MedGuard? Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.teal600,
                  ),
                ),
              ],
            ),
          ),
>>>>>>> df2bcedb218e64c2070eed7c16b24b2c7ec77730
        ),
      ),
    );
  }
}
