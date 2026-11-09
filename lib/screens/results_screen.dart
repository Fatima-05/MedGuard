import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Read the data sent with RouteSettings.
    final data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List interactions = data['interactions'];
    final List questions = data['questions'];

    return Scaffold(
      appBar: AppBar(title: const Text('Analysis Results')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SeverityBadge(level: data['severity']),
          ),
          const SizedBox(height: 12),
          SectionCard(title: 'Summary', child: Text(data['summary'])),
          SectionCard(
            title: 'Interactions found (${interactions.length})',
            child: Column(
              children: [
                for (final item in interactions)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(item['drugs']),
                    trailing: SeverityBadge(level: item['severity']),
                  ),
              ],
            ),
          ),
          SectionCard(
            title: 'Questions for your doctor',
            child: Column(
              children: [
                for (final q in questions)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.help_outline, color: Colors.deepPurple),
                    title: Text(q),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('New Check'),
          ),
        ],
      ),
    );
  }
}
