// All the sample data of the app lives in this one file.

class Medication {
  final String name;
  final String dosage;
  final String frequency;
  final String rxcui;

  const Medication({
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.rxcui,
  });
}

const List<Medication> cardioMeds = [
  Medication(name: 'Warfarin', dosage: '5 mg', frequency: 'Once daily', rxcui: '11289'),
  Medication(name: 'Aspirin', dosage: '81 mg', frequency: 'Once daily', rxcui: '1191'),
  Medication(name: 'Ibuprofen', dosage: '400 mg', frequency: 'As needed', rxcui: '5640'),
  Medication(name: 'Lisinopril', dosage: '10 mg', frequency: 'Once daily', rxcui: '29046'),
];

const List<Medication> neuroMeds = [
  Medication(name: 'Tramadol', dosage: '50 mg', frequency: 'As needed', rxcui: '10689'),
  Medication(name: 'Xanax', dosage: '0.5 mg', frequency: 'As needed', rxcui: '11170'),
  Medication(name: 'Sertraline', dosage: '50 mg', frequency: 'Once daily', rxcui: '36437'),
];

const List<Medication> scannedMeds = [
  Medication(name: 'Warfarin', dosage: '5 mg', frequency: 'Once daily', rxcui: '11289'),
  Medication(name: 'Aspirin', dosage: '81 mg', frequency: 'Once daily', rxcui: '1191'),
];

final List<Map<String, dynamic>> history = [
  {
    'date': 'Oct 14, 2026 · 09:24 AM',
    'severity': 'High',
    'medications': cardioMeds,
    'summary':
        'Combining Warfarin, Aspirin and Ibuprofen multiplies the risk of serious bleeding events and outweighs the intended cardioprotective benefit.',
    'interactions': [
      {'drugs': 'Aspirin + Warfarin', 'severity': 'High'},
      {'drugs': 'Ibuprofen + Warfarin', 'severity': 'High'},
      {'drugs': 'Aspirin + Ibuprofen', 'severity': 'Moderate'},
    ],
    'questions': [
      'Is it safe to keep taking Ibuprofen alongside Warfarin and Aspirin, or should we switch to a different pain reliever?',
      'Should we add a stomach-protecting medicine (like a PPI) to lower the bleeding risk?',
      'How often should we check INR and kidney function now that three clotting-related medicines are combined?',
    ],
  },
  {
    'date': 'Oct 9, 2026 · 06:41 PM',
    'severity': 'Moderate',
    'medications': neuroMeds,
    'summary':
        'Tramadol, Xanax and Sertraline together increase sedation and can raise serotonin levels, so the cumulative central nervous system risk is meaningful.',
    'interactions': [
      {'drugs': 'Tramadol + Xanax', 'severity': 'Moderate'},
      {'drugs': 'Tramadol + Sertraline', 'severity': 'Moderate'},
    ],
    'questions': [
      'Can the Tramadol dose be lowered or replaced given the sedating effect?',
      'What symptoms of serotonin syndrome should we watch for at home?',
      'Should we avoid driving or using stairs while these are taken together?',
    ],
  },
];
