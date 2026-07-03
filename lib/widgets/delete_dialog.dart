import 'package:flutter/material.dart';

class DeleteDialog {
  static Future<bool?> show(BuildContext context, String numeroBoucle) {
    return showDialog<bool>(
      context: context,

      builder: (_) {
        return AlertDialog(
          title: const Text("Confirmation"),

          content: Text("Voulez-vous supprimer l'animal $numeroBoucle ?"),

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
  }
}
