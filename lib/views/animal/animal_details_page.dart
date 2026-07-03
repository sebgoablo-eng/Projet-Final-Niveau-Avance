import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/animal_model.dart';
import '../../providers/animal_provider.dart';

class AnimalDetailsPage extends StatefulWidget {
  const AnimalDetailsPage({super.key});

  @override
  State<AnimalDetailsPage> createState() => _AnimalDetailsPageState();
}

class _AnimalDetailsPageState extends State<AnimalDetailsPage> {
  int currentIndex = 0;

  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnimalProvider>(context);

    if (!initialized) {
      currentIndex = ModalRoute.of(context)!.settings.arguments as int;

      initialized = true;
    }

    if (provider.animals.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Détails")),

        body: const Center(child: Text("Aucun animal trouvé.")),
      );
    }

    Animal animal = provider.animals[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text(animal.numeroBoucle), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            CircleAvatar(
              radius: 45,

              backgroundColor: Colors.green,

              child: Icon(
                animal.sexe == "Mâle" ? Icons.male : Icons.female,

                size: 50,

                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 4,

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [
                    buildInfo(
                      "Numéro de boucle",
                      animal.numeroBoucle,
                      Icons.tag,
                    ),

                    const Divider(),

                    buildInfo("Espèce", animal.espece, Icons.pets),

                    const Divider(),

                    buildInfo("Race", animal.race, Icons.agriculture),

                    const Divider(),

                    buildInfo(
                      "Sexe",
                      animal.sexe,
                      animal.sexe == "Mâle" ? Icons.male : Icons.female,
                    ),

                    const Divider(),

                    buildInfo(
                      "Couleur de la robe",
                      animal.couleurRobe ?? "Non renseignée",
                      Icons.palette,
                    ),

                    const Divider(),

                    buildInfo(
                      "Date de naissance",
                      animal.dateNaissance == null
                          ? "Non renseignée"
                          : DateTime.parse(
                                  animal.dateNaissance!,
                                ).day.toString().padLeft(2, '0') +
                                "/" +
                                DateTime.parse(
                                  animal.dateNaissance!,
                                ).month.toString().padLeft(2, '0') +
                                "/" +
                                DateTime.parse(
                                  animal.dateNaissance!,
                                ).year.toString(),
                      Icons.calendar_today,
                    ),

                    const Divider(),

                    buildInfo(
                      "Poids",
                      animal.poids == null
                          ? "Non renseigné"
                          : "${animal.poids} Kg",
                      Icons.monitor_weight,
                    ),

                    const Divider(),

                    buildInfo(
                      "Statut physiologique",
                      animal.statutPhysiologique ?? "Non renseigné",
                      Icons.favorite,
                    ),

                    const Divider(),

                    buildInfo(
                      "État sanitaire",
                      animal.etatSanitaire ?? "Non renseigné",
                      Icons.local_hospital,
                    ),

                    const Divider(),

                    buildInfo(
                      "Origine",
                      animal.origine ?? "Non renseignée",
                      Icons.location_on,
                    ),

                    if (animal.origine == "Né dans l'exploitation") ...[
                      const Divider(),

                      buildInfo(
                        "Numéro de boucle de la mère",
                        animal.numeroBoucleMere == null ||
                                animal.numeroBoucleMere!.isEmpty
                            ? "Non renseigné"
                            : animal.numeroBoucleMere!,
                        Icons.female,
                      ),
                    ],

                    const Divider(),

                    buildInfo(
                      "Statut de l'animal",
                      animal.statutAnimal ?? "Non renseigné",
                      Icons.assignment,
                    ),

                    const Divider(),

                    buildInfo(
                      "Observations",
                      animal.observations == null ||
                              animal.observations!.isEmpty
                          ? "Aucune observation"
                          : animal.observations!,
                      Icons.notes,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back),

                    label: const Text("Précédent"),

                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),

                    onPressed: currentIndex > 0
                        ? () {
                            setState(() {
                              currentIndex--;
                            });
                          }
                        : null,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_forward),

                    iconAlignment: IconAlignment.end,

                    label: const Text("Suivant"),

                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),

                    onPressed: currentIndex < provider.animals.length - 1
                        ? () {
                            setState(() {
                              currentIndex++;
                            });
                          }
                        : null,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Text(
              "Animal ${currentIndex + 1} sur ${provider.animals.length}",

              style: const TextStyle(
                fontWeight: FontWeight.bold,

                color: Colors.grey,

                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                icon: const Icon(Icons.list),

                label: const Text("Retour à la liste"),

                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfo(String titre, String valeur, IconData icone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Icon(icone, color: Colors.green),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  titre,

                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 3),

                Text(valeur),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
