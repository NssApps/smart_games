

import 'package:flutter/material.dart';
import 'package:smart_games/domain/entities/developer.dart';

class DevelopersList extends StatelessWidget {
  final List<Developer> developers;

  const DevelopersList({super.key, required this.developers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: developers.length,
      itemBuilder: (context, index) {
        final developer = developers[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage (
              developer.imageBackground ?? 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',            
            ),
          ),
          title: Text(developer.name ?? ''),
          subtitle: Text('Games count: ${developer.gamesCount ?? 0}'),
        );
    },);
  }
}