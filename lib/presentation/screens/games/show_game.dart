


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/config/helpers/human_format.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/presentation/providers/games/game_provider.dart';
import 'package:smart_games/presentation/widgets/additional_image.dart';
import 'package:smart_games/presentation/widgets/developers_list.dart';
import 'package:smart_games/presentation/widgets/rating_list.dart';
import 'package:smart_games/presentation/widgets/tags_list.dart';
import 'package:smart_games/presentation/widgets/custom_sliver_appbar.dart';


class ShowGameScreen extends ConsumerStatefulWidget {
  final String gameId;

  const ShowGameScreen({super.key, required this.gameId, });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowGameScreenState();
}

class _ShowGameScreenState extends ConsumerState<ShowGameScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(gameProvider.notifier).getGame(widget.gameId);



  }

  @override
  Widget build(BuildContext context) {
    final Game? game = ref.watch(gameProvider).game;
    final textStyles = Theme.of(context).textTheme;
    final themeColors = Theme.of(context).colorScheme;
    
    return Scaffold(
      body: 
        game == null ?
          const Center(child: CircularProgressIndicator(),)
        :
        CustomScrollView(
          slivers: [
            CustomSliverAppbar(
              title: game.name ?? 'Name not available', 
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

          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TagsList(tags: game.tags ?? []),

                  const SizedBox(height: 20,),

                  game.backgroundImageAdditional != null ?
                    AdditionalImage(url: game.backgroundImageAdditional!)
                  : const SizedBox(),

                  const SizedBox(height: 20,),

                  Text('Ratings', style: textStyles.titleLarge!.copyWith(color: themeColors.primary),),
                  Card(child: RatingList(ratings: game.ratings ?? [])),

                  const SizedBox(height: 20,),
      
                  Text('Description', style: textStyles.titleLarge!.copyWith(color: themeColors.primary),),
                  const SizedBox(height: 5,),
                  Text(game.descriptionRaw ?? 'Description not available'),

                  const SizedBox(height: 20,),

                  Text('Developers', style: textStyles.titleLarge!.copyWith(color: themeColors.primary),),
                  Text('data'),
                  DevelopersList(developers: game.developers ?? []),

                  
          




                ],
              ),
            ),
          ),

    
         
       
        

          const SliverToBoxAdapter(child:  SizedBox(height: 10,)),

          // SliverToBoxAdapter(child: HorizontalListView(drinks: drinksByCategory, title: 'Drinks with xxxxxx',)),

          const SliverToBoxAdapter(child:  SizedBox(height: 50,)),


        ],
      )
    );
    

    // return CupertinoPageScaffold(
    //   child: Stack(
    //     children: [
    //       // Background Image
    //       Positioned.fill(
    //         child: Image.network(
    //                 "https://images.pexels.com/photos/27328445/pexels-photo-27328445/free-photo-of-a-couple-holding-hands-in-front-of-a-brick-wall.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    //                 fit: BoxFit.cover,
    //               )
    //       ),
    //       // Cupertino Navigation Bar
    //       Positioned(
    //         left: 0,
    //         right: 0,
    //         child: CupertinoNavigationBar(
    //           middle: Text('My Cupertino App'),
    //           backgroundColor: Colors.transparent,
    //         ),
    //       ),
    //     ],
    //   ),
    // );

  }
}





