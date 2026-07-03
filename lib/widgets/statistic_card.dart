import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  final Widget chart;

  final String title;

  const StatisticCard({super.key, required this.chart, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,

      child: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [
            Text(
              title,

              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(height: 15),

            SizedBox(height: 250, child: chart),
          ],
        ),
      ),
    );
  }
}
