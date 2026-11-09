import 'package:flutter/material.dart';

import '../colors.dart';
import '../widgets/medication_card.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: const AppNavBar(active: 'checker'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              const Text(
                'Analysis Results',
                style: TextStyle(
                  fontSize:22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.slate900,
                ),
              ),
              const SizedBox(height:12),
              Align(
                alignment: Alignment.centerLeft,
                child: SeverityBadge(level: sampleSummary.severity),
              ),
              const SizedBox(height:16),

              // Summary
              _Box(
                title:'Summary',
                child:Text(
                  sampleSummary.severityJustification,
                  style: const TextStyle(
                    fontSize:13,
                    height:1.5,
                    color: AppColors.slate600,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Interactions
              _Box(
                title:'Interactions found (${sampleInteractions.length})',
                child:Column(
                  children: [
                    for (final item in sampleInteractions)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${item.drugs[0].name} + ${item.drugs[1].name}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.slate800,
                                ),
                              ),
                            ),
                            SeverityBadge(
                              level: item.severity,
                              compact: true,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height:16),

              _Box(
                title:'Questions for your doctor',
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    for (final q in sampleSummary.questions)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.help_outline_rounded,
                              size:16,
                              color: AppColors.violet600,
                            ),
                            const SizedBox(width:8),
                            Expanded(
                              child: Text(
                                q,
                                style: const TextStyle(
                                  fontSize:12.5,
                                  height:1.45,
                                  color: AppColors.slate700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height:16),
              OutlinedButton(
                onPressed:(){},
                child: const Text('New Check'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Box extends StatelessWidget{
  final String title;
  final Widget child;

  const _Box({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize:14,
              fontWeight: FontWeight.w800,
              color: AppColors.slate900,
            ),
          ),
          const SizedBox(height:12),
          child,
        ],
      ),
    );
  }
}
