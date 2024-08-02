

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smart_games/domain/entities/screenshot.dart';

class ScreenshotsList extends StatelessWidget {
  final List<Screenshot> screenshots;

  const ScreenshotsList({super.key, required this.screenshots});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: screenshots.length,
        itemBuilder: (context, index) {
          final Screenshot screenshot = screenshots[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                screenshot.image ?? 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',        
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress != null) {
                    return const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12),
                    );
                  }
                  
                  return FadeIn(child: child);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}