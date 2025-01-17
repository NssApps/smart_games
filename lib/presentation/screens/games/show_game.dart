
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/config/helpers/human_format.dart';
import 'package:smart_games/domain/entities/achievement.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/domain/entities/screenshot.dart';
import 'package:smart_games/presentation/providers/games/achievements_provider.dart';
import 'package:smart_games/presentation/providers/games/game_provider.dart';
import 'package:smart_games/presentation/providers/games/screenshots_provider.dart';
import 'package:smart_games/presentation/widgets/additional_image.dart';
import 'package:smart_games/presentation/widgets/ahievements_list.dart';
import 'package:smart_games/presentation/widgets/developers_list.dart';
import 'package:smart_games/presentation/widgets/rating_list.dart';
import 'package:smart_games/presentation/widgets/screenshots_list.dart';
import 'package:smart_games/presentation/widgets/stores_list.dart';
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
    ref.read(screenshotsProvider.notifier).getScreenshots(widget.gameId);
    ref.read(achievementsProvider.notifier).getAchievements(widget.gameId);
  }

  @override
  Widget build(BuildContext context) {
    final Game? game = ref.watch(gameProvider).game;
    final List<Screenshot> screenshots = ref.watch(screenshotsProvider);
    final List<Achievement> achievements = ref.watch(achievementsProvider);
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
                mainAxisSize: MainAxisSize.min,
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

                  Text('Stores', style: textStyles.titleLarge!.copyWith(color: themeColors.primary),),
                  StoresList(stores: game.storeModels ?? []),

                  const SizedBox(height: 20,),

                  Text('Screenshots', style: textStyles.titleLarge!.copyWith(color: themeColors.primary),),
                  ScreenshotsList(screenshots: screenshots),

                  const SizedBox(height: 40,),

                  if(achievements.isNotEmpty ) 
                    Text('Achievements', style: textStyles.titleLarge!.copyWith(color: themeColors.primary),),
                  if(achievements.isNotEmpty ) 
                    AchievementsList(achievements: achievements),

                  const SizedBox(height: 20,),

                  Text('Developers', style: textStyles.titleLarge!.copyWith(color: themeColors.primary),),
    
                ],
              ),
            ),
          ),

          
          DevelopersList(developers: game.developers ?? []),

          const SliverToBoxAdapter(child: SizedBox(height: 50,),)
    
        ],
      )
    );

  }
}