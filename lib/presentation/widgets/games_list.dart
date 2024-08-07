

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/presentation/widgets/pill_card.dart';

class GamesList extends StatelessWidget {
  final List<Game> games;

  const GamesList({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: games.length,
        itemBuilder: (context, index) {
          final Game game = games[index];
          return Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () => context.push('/games/${game.id}'),
              child: PillCard(title: game.name!,)),
          );
        },
      ),
    );
  }
}