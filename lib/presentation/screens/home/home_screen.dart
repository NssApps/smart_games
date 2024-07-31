
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/presentation/providers/games/games_provider.dart';
import 'package:smart_games/presentation/providers/games/latest_games_provider.dart';
import 'package:smart_games/presentation/providers/games/most_pupular_games_provider.dart';
import 'package:smart_games/presentation/widgets/game_slideshow.dart';
import 'package:smart_games/presentation/widgets/horizontal_listview.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(gamesProvider.notifier).getGames();
    ref.read(latestGamesProvider.notifier).getLatestGames();
    ref.read(mostPoplarGamesProvider.notifier).getMostPopularGames();

  }
  @override
  Widget build(BuildContext context) {
    final List<Game> games = ref.watch(gamesProvider);
    final List<Game> latestGames = ref.watch(latestGamesProvider);
    final List<Game> mostPopularGames = ref.watch(mostPoplarGamesProvider);

    if(games.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(strokeWidth: 2,),),
      );
    }

    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const CupertinoSliverNavigationBar(
            heroTag: 'home',
            largeTitle: Text('Home', style: TextStyle(color: Colors.white),),
          ),
        ],
        body: CustomScrollView(
          slivers: [

            // SliverToBoxAdapter(
            //   child: GameSlideShow(games: games),
            // ),




          // SliverToBoxAdapter(
          //   child: GameHorizontalListview(
          //     title: 'Most Popular',
          //     games: mostPopularGames),
          // ),

          // SliverToBoxAdapter(
          //   child: GameHorizontalListview(
          //     title: 'Latest Game',
          //     games: latestGames),
          // )
            
          ],
        )
      )
    );
  }
}