// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'colors.dart';
import 'screens/splash_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/checker_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/results_screen.dart';
import 'screens/history_screen.dart';

void main() {
  runApp(const MedGuardApp());
}

class MedGuardApp extends StatelessWidget {
  const MedGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedGuard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.teal600),
        scaffoldBackgroundColor: AppColors.canvas,
      ),
      home: const SplashScreen(),
      // home: const LandingScreen(),
      // home: const AuthScreen(),
      // home: const CheckerScreen(),
      // home: const ScanScreen(),
      // home: const ResultsScreen(),
      // home: const HistoryScreen(),
    );
  }
}
