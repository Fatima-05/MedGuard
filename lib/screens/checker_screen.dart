import 'package:flutter/material.dart';

import '../colors.dart';
import '../widgets/medication_card.dart';

class CheckerScreen extends StatelessWidget{
  const CheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavBar(active:'checker'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              const Text(
                'Medication Checker',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.slate900,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Add all the medicines to check for interactions.',
                style: TextStyle(
                  fontSize: 12.5,
                  color: AppColors.slate500,
                ),
              ),
              const SizedBox(height: 18),
              const TextField(
                decoration:InputDecoration(
                  hintText:'Type a drug name...',
                  border:OutlineInputBorder(),
                  filled:true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                'YOUR MEDICATIONS (${cardiopulmonaryRegimen.length})',
                style: const TextStyle(
                  fontSize:11,
                  fontWeight:FontWeight.w700,
                  letterSpacing:1.4,
                  color: AppColors.slate400,
                ),
              ),
              const SizedBox(height: 12),
              for (final med in cardiopulmonaryRegimen) ...[
                MedicationCard(medication: med),
                const SizedBox(height: 10),
              ],
              const SizedBox(height: 10),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.teal600,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed:(){},
                child:const Text(
                  'Check Interactions',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
