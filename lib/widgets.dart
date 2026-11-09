import 'package:flutter/material.dart';
import '../data.dart';
import '../screens/checker_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/history_screen.dart';
import '../screens/landing_screen.dart';

// A card showing one medicine. The remove button only shows if onRemove is given.
class MedicationCard extends StatelessWidget {
  final Medication medication;
  final VoidCallback? onRemove;

  const MedicationCard({super.key, required this.medication, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.medication, color: Colors.teal),
        title: Text(
          medication.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${medication.dosage} · ${medication.frequency}\nRxCUI: ${medication.rxcui}',
        ),
        isThreeLine: true,
        trailing: onRemove == null
            ? null
            : IconButton(icon: const Icon(Icons.close), onPressed: onRemove),
      ),
    );
  }
}

// A small coloured label: High = red, Moderate = orange, anything else = green.
class SeverityBadge extends StatelessWidget {
  final String level;

  const SeverityBadge({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.green;
    if (level == 'High') {
      color = Colors.red;
    } else if (level == 'Moderate') {
      color = Colors.orange;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        level,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// A card with a title and some content, used on the results screen.
class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}

// The side menu used to move between the main screens.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  // Close the drawer, then replace the current screen with the new one.
  void goTo(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // Go back to the landing screen and clear every screen from the stack,
  // so the Back button cannot return to the logged-in screens.
  void signOut(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LandingScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text(
              'MedGuard',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => goTo(context, const DashboardScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.medication),
            title: const Text('Medication Checker'),
            onTap: () => goTo(context, const CheckerScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () => goTo(context, const HistoryScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign Out'),
            onTap: () => signOut(context),
          ),
        ],
      ),
    );
  }
}
