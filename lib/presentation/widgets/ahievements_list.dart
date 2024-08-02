

import 'package:flutter/material.dart';
import 'package:smart_games/domain/entities/achievement.dart';
import 'package:smart_games/presentation/widgets/achievement_card.dart';

class AchievementsList extends StatelessWidget {
  final List<Achievement> achievements;

  const AchievementsList({super.key, required this.achievements});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          final Achievement achievement = achievements[index];
          return Padding(
            padding: const EdgeInsets.all(5),
            child: AchievementCard(achievement: achievement,),
          );
        },
      ),
    );
  }
}