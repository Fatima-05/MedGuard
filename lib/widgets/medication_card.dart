import 'package:flutter/material.dart';

import '../colors.dart';

class Medication {
  final String name;
  final String dosage;
  final String frequency;
  final String rxcui;
  final String purpose;

  const Medication({
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.rxcui,
    required this.purpose,
  });
}

const List<Medication> cardiopulmonaryRegimen = [
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
  Medication(
    name:'Ibuprofen',
    dosage:'400 mg',
    frequency:'As needed',
    rxcui:'5640',
    purpose:'Pain relief',
  ),
  Medication(
    name:'Lisinopril',
    dosage:'10 mg',
    frequency:'Once daily',
    rxcui:'29046',
    purpose:'Blood pressure',
  ),
];

const List<Medication> neuroRegimen=[
  Medication(
    name:'Tramadol',
    dosage:'50 mg',
    frequency:'As needed',
    rxcui:'10689',
    purpose:'Chronic pain',
  ),
  Medication(
    name:'Xanax',
    dosage:'0.5 mg',
    frequency:'As needed',
    rxcui:'11170',
    purpose:'Anxiety',
  ),
  Medication(
    name:'Sertraline',
    dosage:'50 mg',
    frequency:'Once daily',
    rxcui:'36437',
    purpose:'Antidepressant',
  ),
];

class MedicationCard extends StatelessWidget{
  final Medication medication;

  const MedicationCard({super.key, required this.medication});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.teal50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.teal100),
            ),
            child: const Icon(
              Icons.medication_rounded,
              color: AppColors.teal600,
              size: 19,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medication.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.slate900,
                  ),
                ),
                const SizedBox(height:2),
                Text(
                  '${medication.dosage} · ${medication.frequency}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.slate500,
                  ),
                ),
                const SizedBox(height:3),
                Text(
                  'RxCUI: ${medication.rxcui}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.slate400,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.close_rounded,
            size: 18,
            color: AppColors.slate400,
          ),
        ],
      ),
    );
  }
}

class AiRiskSummary{
  final String severity;
  final String severityJustification;
  final List<String> questions;

  const AiRiskSummary({
    required this.severity,
    required this.severityJustification,
    required this.questions,
  });
}

class PairwiseInteraction{
  final String severity;
  final List<Medication> drugs;

  const PairwiseInteraction({required this.severity, required this.drugs});
}

class AnalysisResult{
  final List<Medication> medications;
  final AiRiskSummary aiSummary;
  final String createdAt;

  const AnalysisResult({
    required this.medications,
    required this.aiSummary,
    required this.createdAt,
  });
}

const AiRiskSummary sampleSummary=AiRiskSummary(
  severity:'High',
  severityJustification:
      'Combining Warfarin, Aspirin and Ibuprofen multiplies the risk of serious bleeding events and outweighs the intended cardioprotective benefit.',
  questions:[
    'Is it safe to keep taking Ibuprofen alongside Warfarin and Aspirin, or should we switch to a different pain reliever?',
    'Should we add a stomach-protecting medicine (like a PPI) to lower the bleeding risk?',
    'How often should we check INR and kidney function now that three clotting-related medicines are combined?',
  ],
);

const List<PairwiseInteraction> sampleInteractions=[
  PairwiseInteraction(
    severity:'High',
    drugs:[
      Medication(
        name:'Aspirin',
        dosage:'81 mg',
        frequency:'Once daily',
        rxcui:'1191',
        purpose:'Antiplatelet',
      ),
      Medication(
        name:'Warfarin',
        dosage:'5 mg',
        frequency:'Once daily',
        rxcui:'11289',
        purpose:'Blood thinner',
      ),
    ],
  ),
  PairwiseInteraction(
    severity:'High',
    drugs:[
      Medication(
        name:'Ibuprofen',
        dosage:'400 mg',
        frequency:'As needed',
        rxcui:'5640',
        purpose:'Pain relief',
      ),
      Medication(
        name:'Warfarin',
        dosage:'5 mg',
        frequency:'Once daily',
        rxcui:'11289',
        purpose:'Blood thinner',
      ),
    ],
  ),
  PairwiseInteraction(
    severity:'Moderate',
    drugs:[
      Medication(
        name:'Aspirin',
        dosage:'81 mg',
        frequency:'Once daily',
        rxcui:'1191',
        purpose:'Antiplatelet',
      ),
      Medication(
        name:'Ibuprofen',
        dosage:'400 mg',
        frequency:'As needed',
        rxcui:'5640',
        purpose:'Pain relief',
      ),
    ],
  ),
];

const List<AnalysisResult> sampleHistory=[
  AnalysisResult(
    medications: cardiopulmonaryRegimen,
    aiSummary: sampleSummary,
    createdAt:'Oct 14, 2026 · 09:24 AM',
  ),
  AnalysisResult(
    medications: neuroRegimen,
    aiSummary: AiRiskSummary(
      severity:'Moderate',
      severityJustification:
          'Tramadol, Xanax and Sertraline together increase sedation and can raise serotonin levels, so the cumulative central nervous system risk is meaningful.',
      questions: [
        'Can the Tramadol dose be lowered or replaced given the sedating effect?',
        'What symptoms of serotonin syndrome should we watch for at home?',
        'Should we avoid driving or using stairs while these are taken together?',
      ],
    ),
    createdAt:'Oct 9, 2026 · 06:41 PM',
  ),
];
