import 'package:flutter/material.dart';
import '../data.dart';
import 'results_screen.dart';
import 'scan_screen.dart';
import '../widgets.dart';

class CheckerScreen extends StatefulWidget {
  const CheckerScreen({super.key});

  @override
  State<CheckerScreen> createState() => _CheckerScreenState();
}

class _CheckerScreenState extends State<CheckerScreen> {
  final nameController = TextEditingController();
  List<Medication> meds = List.from(cardioMeds);

  void addMedicine() {
    String name = nameController.text.trim();
    if (name.isEmpty) return;
    setState(() {
      meds.add(
        Medication(
          name: name,
          dosage: 'Dose not set',
          frequency: 'Not set',
          rxcui: 'N/A',
        ),
      );
      nameController.clear();
    });
  }

  Future<void> openScan() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScanScreen()),
    );
    if (!mounted) return;
    if (result != null) {
      setState(() {
        meds.addAll(result as List<Medication>);
      });
    }
  }

  void checkInteractions() {
    if (meds.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add at least two medicines')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResultsScreen(),
        settings: RouteSettings(
          arguments: {...history[0], 'medications': meds},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication Checker'),
        actions: [
          IconButton(icon: const Icon(Icons.photo_camera), onPressed: openScan),
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Add all the medicines to check for interactions.'),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Type a drug name...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.teal,
                  size: 36,
                ),
                onPressed: addMedicine,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'YOUR MEDICATIONS (${meds.length})',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          for (int i = 0; i < meds.length; i++)
            MedicationCard(
              medication: meds[i],
              onRemove: () {
                setState(() {
                  meds.removeAt(i);
                });
              },
            ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: checkInteractions,
            child: const Text('Check Interactions'),
          ),
        ],
      ),
    );
  }
}
