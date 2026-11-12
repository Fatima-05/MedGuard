import 'package:flutter/material.dart';
import '../data.dart';
import '../widgets.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  void showMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Camera is not connected yet')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Medication Label')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Point the camera at the medicine label.'),
          const SizedBox(height: 14),
          Container(
            height: 180,
            color: Colors.grey.shade300,
            child: const Center(child: Icon(Icons.photo_camera, size: 60)),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => showMessage(context),
                  icon: const Icon(Icons.photo_camera),
                  label: const Text('Capture'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => showMessage(context),
                  icon: const Icon(Icons.upload),
                  label: const Text('Upload'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'DETECTED (${scannedMeds.length})',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          for (final med in scannedMeds) MedicationCard(medication: med),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => Navigator.pop(context, scannedMeds),
            child: const Text('Add to My List'),
          ),
        ],
      ),
    );
  }
}
