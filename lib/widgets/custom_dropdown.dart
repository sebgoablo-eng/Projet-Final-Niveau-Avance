import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;

  final IconData icon;

  final List<String> items;

  final String? value;

  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,

    required this.label,

    required this.icon,

    required this.items,

    required this.value,

    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,

      decoration: InputDecoration(
        labelText: label,

        prefixIcon: Icon(icon),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),

      items: items.map((e) {
        return DropdownMenuItem(value: e, child: Text(e));
      }).toList(),

      onChanged: onChanged,
    );
  }
}
