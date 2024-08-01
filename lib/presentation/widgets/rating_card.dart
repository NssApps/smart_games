

import 'package:flutter/material.dart';
import 'package:smart_games/domain/entities/rating.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class RatingCard extends StatelessWidget {
  final Rating rating;

  const RatingCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      width: 140,
      height: 100,
      // color: Colors.amber,
      child: Column(
        children: [
          Text('${rating.percent}%', style: textStyles.titleLarge!.copyWith(color: Colors.green),),
          Text('${rating.count} rated'),
          Text(toBeginningOfSentenceCase(rating.title) ?? '', ),
        ],
      ),
    );
  }
}