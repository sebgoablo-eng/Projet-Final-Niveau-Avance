class Validators {
  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Champ obligatoire";
    }

    return null;
  }

  static String? poids(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final poids = double.tryParse(value);

    if (poids == null) {
      return "Poids invalide";
    }

    return null;
  }
}
