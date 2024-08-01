
import 'package:flutter/material.dart';
import 'package:smart_games/domain/entities/tag.dart';
import 'package:smart_games/presentation/widgets/pill_card.dart';


class TagsList extends StatelessWidget {
  final List<Tag> tags;

  const TagsList({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, index) {
            final Tag tag = tags[index];
            return Padding(
              padding: const EdgeInsets.all(5),
              child: PillCard(title: tag.name,),
            );
          },
        ),
      );
  }
}


