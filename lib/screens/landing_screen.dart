import 'package:flutter/material.dart';

import '../colors.dart';

class LandingScreen extends StatelessWidget{
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: const AppNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[const _Hero(), const _HowItWorks(), const _Footer()],
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget{
  const _Hero();

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: AppColors.slate200)),
      ),
      child: Stack(
        children: [
          Positioned(
            top:-60,
            left:0,
            right:0,
            child:Center(
              child:Container(
                width:320,
                height:320,
                decoration:BoxDecoration(
                  gradient:RadialGradient(
                    colors:[
                      AppColors.teal600.withValues(alpha: 0.08),
                      AppColors.teal600.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:const EdgeInsets.fromLTRB(20,44,20,56),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.teal50,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.teal100),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.gpp_maybe_rounded,
                        size: 16,
                        color: AppColors.teal600,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'CLINICAL-GRADE SAFETY ASSISTANT',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                          color: AppColors.teal700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 33,
                      height: 1.15,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.8,
                      color: AppColors.slate900,
                    ),
                    children: [
                      TextSpan(text: 'Protect Your Loved Ones From '),
                      TextSpan(
                        text: 'Dangerous Drug Interactions',
                        style: TextStyle(color: AppColors.teal700),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 22),
                const Text(
                  "When managing multiple prescriptions from different doctors, dangerous interactions can go unnoticed. MedGuard cross-checks the National Library of Medicine and synthesizes immediate, plain-language risk alerts powered by Gemini.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: AppColors.slate500,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width:double.infinity,
                  child:FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.teal600,
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed:(){},
                    child: const Text(
                      'Start Free Analysis',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width:double.infinity,
                  child:OutlinedButton(
                    style:OutlinedButton.styleFrom(
                      foregroundColor: AppColors.slate600,
                      side: const BorderSide(color: AppColors.slate200),
                      padding: const EdgeInsets.symmetric(vertical:17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed:(){},
                    child:const Text(
                      'Learn More',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HowItWorks extends StatelessWidget {
  const _HowItWorks();

  @override
  Widget build(BuildContext context) {
    final steps = [
      (
        Icons.search_rounded,
        '1. List Medications',
        'Enter all the medicines your loved one takes.',
      ),
      (
        Icons.gpp_maybe_rounded,
        '2. Check Interactions',
        'MedGuard compares every pair using the National Library of Medicine.',
      ),
      (
        Icons.auto_awesome_rounded,
        '3. Get a Simple Report',
        'Gemini explains the risks in plain language and suggests questions for the doctor.',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 36, 20, 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'How It Works',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              color: AppColors.slate900,
            ),
          ),
          const SizedBox(height: 22),
          for (final step in steps) ...[
            _StepCard(icon: step.$1, title: step.$2, body: step.$3),
            const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const _StepCard({
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.teal50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.teal100),
            ),
            child: Icon(icon, size: 20, color: AppColors.teal600),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.slate800,
            ),
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 42),
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13.5,
                height: 1.55,
                color: AppColors.slate500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.slate200)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
      child: const Column(
        children: [
          Text(
            'MedGuard',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.teal900,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Not a substitute for professional medical advice.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: AppColors.slate500),
          ),
          SizedBox(height: 4),
          Text(
            '© 2026 MedGuard',
            style: TextStyle(fontSize: 11, color: AppColors.slate400),
          ),
        ],
      ),
    );
  }
}
