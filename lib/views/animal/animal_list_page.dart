import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/app_routes.dart';
import '../../models/animal_model.dart';
import '../../providers/animal_provider.dart';

class AnimalListPage extends StatefulWidget {
  const AnimalListPage({super.key});

  @override
  State<AnimalListPage> createState() => _AnimalListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {
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
      appBar: AppBar(title: const Text("Liste du troupeau")),

      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.animals.isEmpty
          ? const Center(
              child: Text(
                "Aucun animal enregistré.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: provider.animals.length,

              itemBuilder: (context, index) {
                Animal animal = provider.animals[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),

                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,

                        AppRoutes.animalDetails,

                        arguments: index,
                      );
                    },

                    leading: CircleAvatar(
                      backgroundColor: Colors.green,

                      child: Text(
                        animal.sexe == "M" ? "♂" : "♀",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    title: Text(animal.numeroBoucle),

                    subtitle: Text("${animal.race} • ${animal.sexe}"),

                    trailing: SizedBox(
                      width: 100,

                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),

                            onPressed: () {
                              Navigator.pushNamed(
                                context,

                                AppRoutes.editAnimal,

                                arguments: animal,
                              );
                            },
                          ),

                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),

                            onPressed: () {
                              _deleteAnimal(animal);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),

        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addAnimal);
        },
      ),
    );
  }

  Future<void> _deleteAnimal(Animal animal) async {
    bool? confirmation = await showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text("Confirmation"),

          content: Text(
            "Voulez-vous supprimer l'animal ${animal.numeroBoucle} ?",
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },

              child: const Text("Annuler"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },

              child: const Text("Supprimer"),
            ),
          ],
        );
      },
    );

    if (confirmation == true) {
      bool success = await context.read<AnimalProvider>().deleteAnimal(
        animal.id!,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: success ? Colors.green : Colors.red,

          content: Text(
            success
                ? "Animal supprimé avec succès."
                : "Échec de la suppression.",
          ),
        ),
      );
    }
  }
}
