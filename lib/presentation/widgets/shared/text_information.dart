import 'package:flutter/material.dart';
class TextInformation extends StatelessWidget {
  const TextInformation({
    super.key,
    required this.category,
    required this.name,
  });

  final String category;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        category,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Text(
        name,
        style: const TextStyle(
            color: Color.fromARGB(255, 106, 61, 2),
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
