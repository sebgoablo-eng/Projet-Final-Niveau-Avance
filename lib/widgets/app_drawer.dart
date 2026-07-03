import 'package:flutter/material.dart';

import '../config/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Icon(Icons.agriculture, color: Colors.white, size: 60),

                SizedBox(height: 10),

                Text(
                  "AgriTroupeau",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.dashboard),

            title: const Text("Tableau de bord"),

            onTap: () {
              Navigator.pushNamed(context, AppRoutes.dashboard);
            },
          ),

          ListTile(
            leading: const Icon(Icons.list),

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
        ],
      ),
    );
  }
}
