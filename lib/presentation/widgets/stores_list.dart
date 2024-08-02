

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_games/domain/entities/store.dart';
import 'package:smart_games/infrastructure/models/store_model.dart';
import 'package:smart_games/presentation/widgets/store_card.dart';

class StoresList extends StatelessWidget {
  final List<StoreModel> stores;

  const StoresList({super.key, required this.stores});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stores.length,
        itemBuilder: (context, index) {
          final Store store = stores[index].store;
          return Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                if(store.domain != null) {
                  context.push('/webViewer/${store.domain}/${store.name}');
                }
              },
              child: StoreCard(store: store,)),
          );
        },
      ),
    );
  }
}