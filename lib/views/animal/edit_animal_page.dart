import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/animal_model.dart';
import '../../providers/animal_provider.dart';

class EditAnimalPage extends StatefulWidget {
  const EditAnimalPage({super.key});

  @override
  State<EditAnimalPage> createState() => _EditAnimalPageState();
}

class _EditAnimalPageState extends State<EditAnimalPage> {
  final _formKey = GlobalKey<FormState>();

  late Animal animal;

  bool initialized = false;

  //======================
  // Controllers
  //======================

  final numeroBoucleController = TextEditingController();

  final especeController = TextEditingController();

  final raceController = TextEditingController();

  final couleurController = TextEditingController();

  final poidsController = TextEditingController();

  final boucleMereController = TextEditingController();

  final observationController = TextEditingController();

  //======================
  // Variables
  //======================

  DateTime? dateNaissance;

  String? sexe;

  String? statutPhysiologique;

  String? etatSanitaire;

  String? origine;

  String? statutAnimal;

  //======================
  // Listes déroulantes
  //======================

  final List<String> sexes = ["Mâle", "Femelle"];

  final List<String> statutsPhysiologiques = [
    "Gestante",
    "Allaitante",
    "Reproducteur",
    "Castré",
    "En Chaleur",
    "Engraissement",
  ];

  final List<String> etatsSanitaires = ["Bonne Santé", "Malade"];

  final List<String> origines = [
    "Né dans l'exploitation",
    "Acheté",
    "Don",
    "Échange",
    "Héritage",
    "Transfert d'un autre élevage",
  ];

  final List<String> statutsAnimal = [
    "Actif",
    "Vendu",
    "Décédé",
    "Abattu",
    "Perdu",
    "Donné",
    "Réformé",
  ];

  Future<void> choisirDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateNaissance ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        dateNaissance = picked;
      });
    }
  }

  void initialiserAnimal() {
    numeroBoucleController.text = animal.numeroBoucle;

    especeController.text = animal.espece;

    raceController.text = animal.race;

    couleurController.text = animal.couleurRobe ?? "";

    poidsController.text = animal.poids?.toString() ?? "";

    boucleMereController.text = animal.numeroBoucleMere ?? "";

    observationController.text = animal.observations ?? "";

    sexe = animal.sexe;

    statutPhysiologique = animal.statutPhysiologique;

    etatSanitaire = animal.etatSanitaire;

    origine = animal.origine;

    statutAnimal = animal.statutAnimal;

    if (animal.dateNaissance != null) {
      dateNaissance = DateTime.parse(animal.dateNaissance!);
    }
  }

  @override
  void dispose() {
    numeroBoucleController.dispose();
    especeController.dispose();
    raceController.dispose();
    couleurController.dispose();
    poidsController.dispose();
    boucleMereController.dispose();
    observationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnimalProvider>(context);

    if (!initialized) {
      animal = ModalRoute.of(context)!.settings.arguments as Animal;

      initialiserAnimal();

      initialized = true;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Modifier un animal")),

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                //======================
                // Numéro de boucle
                //======================
                TextFormField(
                  controller: numeroBoucleController,
                  decoration: const InputDecoration(
                    labelText: "Numéro de boucle *",
                    prefixIcon: Icon(Icons.tag),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Veuillez saisir le numéro de boucle";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                //======================
                // Espèce
                //======================
                TextFormField(
                  controller: especeController,
                  decoration: const InputDecoration(
                    labelText: "Espèce *",
                    prefixIcon: Icon(Icons.pets),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Veuillez saisir l'espèce";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                //======================
                // Race
                //======================
                TextFormField(
                  controller: raceController,
                  decoration: const InputDecoration(
                    labelText: "Race *",
                    prefixIcon: Icon(Icons.agriculture),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Veuillez saisir la race";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                //======================
                // Sexe
                //======================
                DropdownButtonFormField<String>(
                  value: sexe,
                  decoration: const InputDecoration(
                    labelText: "Sexe *",
                    prefixIcon: Icon(Icons.wc),
                  ),
                  items: sexes.map((item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      sexe = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? "Sélectionnez le sexe" : null,
                ),

                const SizedBox(height: 15),

                //======================
                // Couleur de la robe
                //======================
                TextFormField(
                  controller: couleurController,
                  decoration: const InputDecoration(
                    labelText: "Couleur de la robe",
                    prefixIcon: Icon(Icons.palette),
                  ),
                ),

                const SizedBox(height: 15),

                //======================
                // Date de naissance
                //======================
                InkWell(
                  onTap: choisirDate,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: "Date de naissance",
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    child: Text(
                      dateNaissance == null
                          ? "Choisir une date"
                          : "${dateNaissance!.day}/${dateNaissance!.month}/${dateNaissance!.year}",
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                //======================
                // Poids
                //======================
                TextFormField(
                  controller: poidsController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: "Poids (Kg)",
                    prefixIcon: Icon(Icons.monitor_weight),
                  ),
                ),

                const SizedBox(height: 15),

                //======================
                // Statut physiologique
                //======================
                DropdownButtonFormField<String>(
                  value: statutPhysiologique,
                  decoration: const InputDecoration(
                    labelText: "Statut physiologique",
                    prefixIcon: Icon(Icons.favorite),
                  ),
                  items: statutsPhysiologiques.map((item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      statutPhysiologique = value;
                    });
                  },
                ),

                const SizedBox(height: 15),

                //======================
                // État sanitaire
                //======================
                DropdownButtonFormField<String>(
                  value: etatSanitaire,
                  decoration: const InputDecoration(
                    labelText: "État sanitaire",
                    prefixIcon: Icon(Icons.local_hospital),
                  ),
                  items: etatsSanitaires.map((item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      etatSanitaire = value;
                    });
                  },
                ),

                const SizedBox(height: 15),

                //======================
                // Origine
                //======================
                DropdownButtonFormField<String>(
                  value: origine,
                  decoration: const InputDecoration(
                    labelText: "Origine",
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  items: origines.map((item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      origine = value;
                    });
                  },
                ),

                const SizedBox(height: 15),

                //======================
                // Numéro de boucle de la mère
                //======================
                if (origine == "Né dans l'exploitation") ...[
                  TextFormField(
                    controller: boucleMereController,
                    decoration: const InputDecoration(
                      labelText: "Numéro de boucle de la mère",
                      prefixIcon: Icon(Icons.female),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],

                //======================
                // Statut de l'animal
                //======================
                DropdownButtonFormField<String>(
                  value: statutAnimal,
                  decoration: const InputDecoration(
                    labelText: "Statut de l'animal",
                    prefixIcon: Icon(Icons.assignment),
                  ),
                  items: statutsAnimal.map((item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      statutAnimal = value;
                    });
                  },
                ),

                const SizedBox(height: 15),

                //======================
                // Observations
                //======================
                TextFormField(
                  controller: observationController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: "Observations",
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.notes),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text(
                      "Mettre à jour",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      if (statutPhysiologique == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Veuillez sélectionner le statut physiologique.",
                            ),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }

                      if (etatSanitaire == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Veuillez sélectionner l'état sanitaire.",
                            ),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }

                      if (origine == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Veuillez sélectionner l'origine."),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }

                      if (statutAnimal == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Veuillez sélectionner le statut de l'animal.",
                            ),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }

                      final animalModifie = Animal(
                        id: animal.id,

                        numeroBoucle: numeroBoucleController.text.trim(),

                        espece: especeController.text.trim(),

                        race: raceController.text.trim(),

                        sexe: sexe!,

                        couleurRobe: couleurController.text.trim().isEmpty
                            ? null
                            : couleurController.text.trim(),

                        dateNaissance: dateNaissance?.toIso8601String(),

                        poids: poidsController.text.trim().isEmpty
                            ? null
                            : double.tryParse(
                                poidsController.text.replaceAll(",", "."),
                              ),

                        statutPhysiologique: statutPhysiologique,

                        etatSanitaire: etatSanitaire,

                        origine: origine,

                        numeroBoucleMere: origine == "Né dans l'exploitation"
                            ? boucleMereController.text.trim()
                            : null,

                        statutAnimal: statutAnimal,

                        observations: observationController.text.trim().isEmpty
                            ? null
                            : observationController.text.trim(),
                      );

                      bool success = await provider.updateAnimal(animalModifie);

                      if (!mounted) return;

                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              "Modification enregistrée avec succès.",
                            ),
                          ),
                        );

                        Navigator.pop(context, true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Erreur lors de la modification."),
                          ),
                        );
                      }
                    },
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
