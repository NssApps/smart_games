

import 'package:flutter/material.dart';

class PillCard extends StatelessWidget {
  final String title;

  const PillCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: themeColors.inversePrimary,
            child: Center(
              child: Text(title,
                  style: const TextStyle(
                    color: Colors.white,
                  )),
            )),
      );
  }
}