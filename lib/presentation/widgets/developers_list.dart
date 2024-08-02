

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_games/domain/entities/developer.dart';

class DevelopersList extends StatelessWidget {
  final List<Developer> developers;

  const DevelopersList({super.key, required this.developers});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: developers.length,
      itemBuilder: (context, index) {
        final developer = developers[index];
        return ListTile(
          title: Text(developer.name ?? ''),
          leading: CircleAvatar(
              backgroundImage: NetworkImage (
                developer.imageBackground ?? 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',            
              ),
            ),
          // onTap: () {
          //   context.push('/webViewer/${store.domain}/${store.name}');
          // },
          // trailing: const Icon(Icons.chevron_right_outlined),
          );
      }, separatorBuilder: (BuildContext context, int index) { return const Divider(height: 1,); },
    );



  }
}