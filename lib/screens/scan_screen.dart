import 'package:flutter/material.dart';

import '../colors.dart';
import '../widgets/medication_card.dart';

class ScanScreen extends StatelessWidget{
  const ScanScreen({super.key});

  static const List<Medication> _detected=[
    Medication(
      name:'Warfarin',
      dosage:'5 mg',
      frequency:'Once daily',
      rxcui:'11289',
      purpose:'Blood thinner',
    ),
    Medication(
      name:'Aspirin',
      dosage:'81 mg',
      frequency:'Once daily',
      rxcui:'1191',
      purpose:'Antiplatelet',
    ),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: const AppNavBar(active:'checker'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              const Text(
                'Scan Medication Label',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.slate900,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Point the camera at the medicine label.',
                style: TextStyle(
                  fontSize: 12.5,
                  color: AppColors.slate500,
                ),
              ),
              const SizedBox(height:18),
              const SizedBox(height:14),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.teal600,
                        padding: const EdgeInsets.symmetric(vertical:14),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.photo_camera_rounded, size:18),
                      label: const Text('Capture'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical:14),
                      ),
                      onPressed:(){},
                      icon: const Icon(Icons.upload_rounded, size:18),
                      label: const Text('Upload'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:24),
              Text(
                'DETECTED (${_detected.length})',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.4,
                  color: AppColors.slate400,
                ),
              ),
              const SizedBox(height:12),
              for (final med in _detected) ...[
                MedicationCard(medication: med),
                const SizedBox(height:10),
              ],
              const SizedBox(height:8),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.teal600,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed:(){},
                child: const Text(
                  'Add to My List',
                  style: TextStyle(
                    fontSize:15,
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
