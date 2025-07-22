import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  final List<String> ingredients;

  const Ingredients({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ingredients.isEmpty
          ? const Center(child: Text("No ingredients added"))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                final name = ingredients[index];

                return Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Container(
                    height: 76,
                    decoration: BoxDecoration(
                      color: const Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          const Icon(Icons.restaurant_menu_outlined,
                              color: Colors.orange),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              name,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
