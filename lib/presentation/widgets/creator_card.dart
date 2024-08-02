

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smart_games/domain/entities/creator.dart';

class CreatorCard extends StatelessWidget {
  final Creator creator;

  const CreatorCard({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      width: 200,
      height: 200,
      // color: Colors.amber,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              creator.image ?? 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
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
          Text(creator.name, style: textStyles.titleMedium!.copyWith(color: Colors.green,), maxLines: 1, overflow: TextOverflow.ellipsis,),
          // Text('Games count ${store.gamesCount}', maxLines: 1, overflow: TextOverflow.ellipsis),
        
        ],
      ),
    );
  }
}