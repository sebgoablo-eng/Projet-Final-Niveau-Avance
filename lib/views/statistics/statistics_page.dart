import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/animal_provider.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnimalProvider>(context);

    if (provider.animals.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Statistiques"), centerTitle: true),
        body: const Center(
          child: Text(
            "Aucune donnée statistique disponible.",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Statistiques"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            buildSectionTitle("Répartition selon le sexe"),

            buildChartCard(provider.sexeStatistics),

            const SizedBox(height: 20),

            buildSectionTitle("Répartition selon l'espèce"),

            buildChartCard(provider.especeStatistics),

            const SizedBox(height: 20),

            buildSectionTitle("Répartition selon l'état sanitaire"),

            buildChartCard(provider.etatSanitaireStatistics),

            const SizedBox(height: 20),

            buildSectionTitle("Répartition selon le statut physiologique"),

            buildChartCard(provider.statutPhysiologiqueStatistics),

            const SizedBox(height: 20),

            buildSectionTitle("Répartition selon la race"),

            buildChartCard(provider.raceStatistics),

            const SizedBox(height: 20),

            buildSectionTitle("Répartition selon l'origine"),

            buildChartCard(provider.origineStatistics),

            const SizedBox(height: 20),

            buildSectionTitle("Répartition selon le statut de l'animal"),

            buildChartCard(provider.statutAnimalStatistics),

            const SizedBox(height: 30),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "Résumé du troupeau",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ListTile(
                      leading: const Icon(Icons.pets, color: Colors.green),
                      title: const Text("Nombre total d'animaux"),
                      trailing: Text(
                        provider.totalAnimals.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.favorite, color: Colors.orange),
                      title: const Text("Animaux gestants"),
                      trailing: Text(
                        provider.totalGestantes.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(
                        Icons.local_hospital,
                        color: Colors.red,
                      ),
                      title: const Text("Animaux malades"),
                      trailing: Text(
                        provider.totalMalades.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  Widget buildChartCard(Map<String, int> data) {
    return Card(
      elevation: 4,

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: SizedBox(
          height: 250,

          child: PieChart(
            PieChartData(
              centerSpaceRadius: 40,

              sectionsSpace: 2,

              sections: buildPieSections(data),
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> buildPieSections(Map<String, int> data) {
    final List<Color> colors = [
      Colors.blue,

      Colors.red,

      Colors.green,

      Colors.orange,

      Colors.purple,

      Colors.teal,

      Colors.brown,

      Colors.indigo,

      Colors.cyan,

      Colors.pink,
    ];

    int index = 0;

    return data.entries.map((entry) {
      final color = colors[index % colors.length];

      index++;

      return PieChartSectionData(
        color: color,

        value: entry.value.toDouble(),

        radius: 80,

        title: "${entry.key}\n${entry.value}",

        titleStyle: const TextStyle(
          fontSize: 12,

          fontWeight: FontWeight.bold,

          color: Colors.white,
        ),
      );
    }).toList();
  }
}
