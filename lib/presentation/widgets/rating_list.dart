

import 'package:flutter/material.dart';
import 'package:smart_games/domain/entities/rating.dart';
import 'package:smart_games/presentation/widgets/rating_card.dart';

class RatingList extends StatelessWidget {
  final List<Rating> ratings;

  const RatingList({super.key, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ratings.length,
          itemBuilder: (context, index) {
            final Rating rating = ratings[index];
            return Padding(
              padding: const EdgeInsets.all(5),
              child: RatingCard(rating: rating,),
            );
          },
        ),
      );
  }
}