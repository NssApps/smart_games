

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/creator.dart';
import 'package:smart_games/presentation/widgets/custom_sliver_appbar.dart';

class ShowCreator extends ConsumerStatefulWidget {
  final String creatorId;

  const ShowCreator({super.key, required this.creatorId});

  @override
  ShowCreatorState createState() => ShowCreatorState();
}

class ShowCreatorState extends ConsumerState<ShowCreator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(gameProvider.notifier).getGame(widget.creatorId);
  }

  @override
  Widget build(BuildContext context) {
    final Creator? creator = ref.watch(gameProvider).game;

    return Scaffold(
      appBar: AppBar(
      ),
      body: CustomScrollView(
        slivers: [
          CustomSliverAppbar(
              title: creator.name ?? 'Name not available', 
            background: Image.network(game.backgroundImage!, fit: BoxFit.cover,),
            customWidget: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade800,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  if(game.rating != null)
                    Text(
                      HumanFormats.number(game.rating!.toDouble(), 1),
                      style: textStyles.bodyMedium
                          ?.copyWith(color: Colors.yellow.shade800),
                    ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}