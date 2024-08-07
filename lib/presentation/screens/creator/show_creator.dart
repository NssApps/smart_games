

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/config/helpers/human_format.dart';
import 'package:smart_games/domain/entities/creator.dart';
import 'package:smart_games/presentation/providers/creators/creator_provider.dart';
import 'package:smart_games/presentation/widgets/custom_sliver_appbar.dart';
import 'package:smart_games/presentation/widgets/positions_list.dart';
import 'package:smart_games/presentation/widgets/rating_list.dart';

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
    ref.read(creatorProvider.notifier).getCreator(widget.creatorId);
  }

  @override
  Widget build(BuildContext context) {
    final Creator? creator = ref.watch(creatorProvider).creator;
    final textStyles = Theme.of(context).textTheme;
    final themeColors = Theme.of(context).colorScheme;

    return Scaffold(
      body: creator == null ?
        const Center(child: CircularProgressIndicator(),)
        :
      CustomScrollView(
        slivers: [
          CustomSliverAppbar(
              title: creator.name ?? 'Name not available', 
            background: Image.network(creator.image, fit: BoxFit.cover,),
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
                  if(creator.rating != null)
                    Text(
                      HumanFormats.number(double.parse( creator.rating!), 1),
                      style: textStyles.bodyMedium
                          ?.copyWith(color: Colors.yellow.shade800),
                    ),
                ],
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PositionsList(positions: creator.positions ?? []),
                  const SizedBox(height: 10,),
                  Text('About ${creator.name}', style: textStyles.titleLarge!.copyWith(color: themeColors.primary),),
                  const SizedBox(height: 5,),
                  Text(creator.description ?? 'Description not available'),
                  const SizedBox(height: 10,),
                  Text('Ratings', style: textStyles.titleLarge!.copyWith(color: themeColors.primary),),
                  Card(child: RatingList(ratings: creator.ratings ?? [])),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}