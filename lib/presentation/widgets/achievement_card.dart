

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smart_games/domain/entities/achievement.dart';

class AchievementCard extends StatelessWidget {
  final Achievement achievement;

  const AchievementCard({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      width: 250,
      // height: 200,
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              achievement.image ?? 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
              fit: BoxFit.fill,
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
          Text(achievement.name, style: textStyles.titleMedium!.copyWith(color: Colors.green,), maxLines: 1, overflow: TextOverflow.ellipsis,),
          Text(achievement.description, maxLines: 3, overflow: TextOverflow.ellipsis),
          Text('${achievement.percent}%', style: textStyles.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis)
        
        ],
      ),
    );
  }
}