import 'package:flutter/material.dart';
import '../data.dart';
import '../widgets.dart';
import 'checker_screen.dart';
import 'history_screen.dart';
import 'results_screen.dart';

// The first screen the user sees after logging in.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final last = history[0];
    final List<Medication> lastMeds = last['medications'];

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Welcome back!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text('What would you like to do today?'),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.medication, color: Colors.teal),
              title: const Text('Medication Checker'),
              subtitle: const Text('Add medicines and check for interactions'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckerScreen(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.history, color: Colors.teal),
              title: const Text('Analysis History'),
              subtitle: const Text('See your previous medication checks'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'LAST ANALYSIS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              title: Text(
                lastMeds.map((m) => m.name).join(', '),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${last['date']}'),
              trailing: SeverityBadge(level: last['severity']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultsScreen(),
                    settings: RouteSettings(arguments: last),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
