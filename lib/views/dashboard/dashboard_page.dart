import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/animal_provider.dart';
import '../../config/app_routes.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<AnimalProvider>().loadAnimals();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnimalProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("AgriTroupeau"), centerTitle: true),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.agriculture, size: 60, color: Colors.white),

                  SizedBox(height: 10),

                  Text(
                    "AgriTroupeau",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Gestion intelligente du troupeau",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Tableau de bord"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text("Liste du troupeau"),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.animalList);
              },
            ),

            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text("Statistiques"),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.statistics);
              },
            ),

            const Divider(),

            const AboutListTile(
              icon: Icon(Icons.info),
              applicationName: "AgriTroupeau",
              applicationVersion: "1.0",
            ),
          ],
        ),
      ),

      body: RefreshIndicator(
        onRefresh: provider.refresh,

        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),

          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.pets, color: Colors.white),
                  ),

                  title: const Text(
                    "Bienvenue",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  subtitle: const Text(
                    "Application de gestion et de suivi de troupeau.",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              _buildCard(
                "Nombre total d'animaux",
                provider.totalAnimals.toString(),
                Icons.pets,
                Colors.green,
              ),

              const SizedBox(height: 15),

              _buildCard(
                "Animaux gestants",
                provider.totalGestantes.toString(),
                Icons.favorite,
                Colors.orange,
              ),

              const SizedBox(height: 15),

              _buildCard(
                "Animaux malades",
                provider.totalMalades.toString(),
                Icons.local_hospital,
                Colors.red,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  icon: const Icon(Icons.list),

                  label: const Text("Consulter le troupeau"),

                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.animalList);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    String titre,
    String valeur,
    IconData icone,
    Color couleur,
  ) {
    return Card(
      elevation: 5,

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          children: [
            CircleAvatar(
              radius: 30,

              backgroundColor: couleur,

              child: Icon(icone, color: Colors.white),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    titre,

                    style: const TextStyle(
                      fontSize: 16,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    valeur,

                    style: TextStyle(
                      color: couleur,

                      fontWeight: FontWeight.bold,

                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
