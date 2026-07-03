import '../database/tables.dart';

class Animal {
  final int? id;
  final String numeroBoucle;
  final String espece;
  final String race;
  final String sexe;
  final String? couleurRobe;
  final String? dateNaissance;
  final double? poids;
  final String? statutPhysiologique;
  final String? etatSanitaire;
  final String? origine;
  final String? numeroBoucleMere;
  final String? statutAnimal;
  final String? observations;

  const Animal({
    this.id,
    required this.numeroBoucle,
    required this.espece,
    required this.race,
    required this.sexe,
    this.couleurRobe,
    this.dateNaissance,
    this.poids,
    this.statutPhysiologique,
    this.etatSanitaire,
    this.origine,
    this.numeroBoucleMere,
    this.statutAnimal,
    this.observations,
  });

  /// Conversion Objet -> Map (SQLite)
  Map<String, dynamic> toMap() {
    return {
      DBTables.id: id,
      DBTables.numeroBoucle: numeroBoucle,
      DBTables.espece: espece,
      DBTables.race: race,
      DBTables.sexe: sexe,
      DBTables.couleurRobe: couleurRobe,
      DBTables.dateNaissance: dateNaissance,
      DBTables.poids: poids,
      DBTables.statutPhysiologique: statutPhysiologique,
      DBTables.etatSanitaire: etatSanitaire,
      DBTables.origine: origine,
      DBTables.numeroBoucleMere: numeroBoucleMere,
      DBTables.statutAnimal: statutAnimal,
      DBTables.observations: observations,
    };
  }

  /// Conversion Map -> Objet
  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map[DBTables.id],
      numeroBoucle: map[DBTables.numeroBoucle],
      espece: map[DBTables.espece],
      race: map[DBTables.race],
      sexe: map[DBTables.sexe],
      couleurRobe: map[DBTables.couleurRobe],
      dateNaissance: map[DBTables.dateNaissance],
      poids: map[DBTables.poids] == null
          ? null
          : (map[DBTables.poids] as num).toDouble(),
      statutPhysiologique: map[DBTables.statutPhysiologique],
      etatSanitaire: map[DBTables.etatSanitaire],
      origine: map[DBTables.origine],
      numeroBoucleMere: map[DBTables.numeroBoucleMere],
      statutAnimal: map[DBTables.statutAnimal],
      observations: map[DBTables.observations],
    );
  }

  /// Conversion Objet -> JSON
  Map<String, dynamic> toJson() => toMap();

  /// Conversion JSON -> Objet
  factory Animal.fromJson(Map<String, dynamic> json) => Animal.fromMap(json);

  /// Duplication avec modification
  Animal copyWith({
    int? id,
    String? numeroBoucle,
    String? espece,
    String? race,
    String? sexe,
    String? couleurRobe,
    String? dateNaissance,
    double? poids,
    String? statutPhysiologique,
    String? etatSanitaire,
    String? origine,
    String? numeroBoucleMere,
    String? statutAnimal,
    String? observations,
  }) {
    return Animal(
      id: id ?? this.id,
      numeroBoucle: numeroBoucle ?? this.numeroBoucle,
      espece: espece ?? this.espece,
      race: race ?? this.race,
      sexe: sexe ?? this.sexe,
      couleurRobe: couleurRobe ?? this.couleurRobe,
      dateNaissance: dateNaissance ?? this.dateNaissance,
      poids: poids ?? this.poids,
      statutPhysiologique: statutPhysiologique ?? this.statutPhysiologique,
      etatSanitaire: etatSanitaire ?? this.etatSanitaire,
      origine: origine ?? this.origine,
      numeroBoucleMere: numeroBoucleMere ?? this.numeroBoucleMere,
      statutAnimal: statutAnimal ?? this.statutAnimal,
      observations: observations ?? this.observations,
    );
  }

  @override
  String toString() {
    return '''
Animal(
id: $id,
numeroBoucle: $numeroBoucle,
espece: $espece,
race: $race,
sexe: $sexe,
couleurRobe: $couleurRobe,
dateNaissance: $dateNaissance,
poids: $poids,
statutPhysiologique: $statutPhysiologique,
etatSanitaire: $etatSanitaire,
origine: $origine,
numeroBoucleMere: $numeroBoucleMere,
statutAnimal: $statutAnimal,
observations: $observations
)
''';
  }
}
