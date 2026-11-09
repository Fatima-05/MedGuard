import 'package:flutter/material.dart';
import '../data.dart';
import 'results_screen.dart';
import '../widgets.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analysis History')),
      drawer: const Drawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history[index];
          final List<Medication> meds = item['medications'];
          final names = meds.map((m) => m.name).join(', ');

          return Card(
            child: ListTile(
              title: Text(
                names,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${item['date']}\n${meds.length} medications'),
              isThreeLine: true,
              trailing: SeverityBadge(level: item['severity']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultsScreen(),
                    settings: RouteSettings(arguments: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
