

import 'package:flutter/material.dart';
import 'package:smart_games/domain/entities/position.dart';
import 'package:smart_games/presentation/widgets/pill_card.dart';

class PositionsList extends StatelessWidget {
  final List<Position> positions;

  const PositionsList({super.key, required this.positions});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: positions.length,
          itemBuilder: (context, index) {
            final Position position = positions[index];
            return Padding(
              padding: const EdgeInsets.all(5),
              child: PillCard(title: position.name,),
            );
          },
        ),
      );
  }
}
