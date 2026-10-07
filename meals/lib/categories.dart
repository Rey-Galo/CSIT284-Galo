import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick your category')),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
        ),
        children: [
          Text("Rene 1"),
          Text("Rene 2"),
          Text("Rene 3"),
          Text("Rene 4"),
          Text("Rene 5"),
          Text("Rene 6"),
        ],
      ),
    );
  }
}
