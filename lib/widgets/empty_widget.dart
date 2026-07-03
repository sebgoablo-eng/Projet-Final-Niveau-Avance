import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String message;

  const EmptyWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const Icon(Icons.pets, size: 70, color: Colors.grey),

          const SizedBox(height: 15),

          Text(message, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
