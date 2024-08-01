

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AdditionalImage extends StatelessWidget {
  final String url;

  const AdditionalImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
          url,
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
    );
  }
}