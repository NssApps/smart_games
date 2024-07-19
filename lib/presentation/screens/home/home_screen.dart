

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/presentation/providers/games/games_provider.dart';
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

  }
  @override
  Widget build(BuildContext context) {
    final List<Game> games = ref.watch(gamesProvider);

    if(games.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(strokeWidth: 2,),),
      );
    }

    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Home', style: TextStyle(color: Colors.white),),
          ),
        ],
        body: CustomScrollView(
          slivers: [

            SliverToBoxAdapter(
              child: GameSlideShow(games: games),
            ),

    //         SliverGrid.builder(
              
    //       itemCount: games.length,
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
    //       itemBuilder: (context, index) {
    //       final Game game = games[index];
    //             // return IngredientCard(ingredient: ingredient);
    //             return FadeInUp(
    //   child: GestureDetector(
    //     onTap: () => null,
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(20),
    //       child: Image.network(
    //         game.backgroundImage ?? 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',

    //         fit: BoxFit.cover,
    //         loadingBuilder: (context, child, loadingProgress) {
    //           if(loadingProgress != null) {
    //             return const DecoratedBox(
    //               decoration: BoxDecoration(color: Colors.black12),
    //             );
    //           }
              
    //           return FadeIn(child: child);
    //         },
    //       ),
    //     ),
    //   ),
    // );
    //       },),


          SliverToBoxAdapter(
            child: GameHorizontalListview(
              title: 'Most Popular',
              games: games),
          ),

          SliverToBoxAdapter(
            child: GameHorizontalListview(
              title: 'Latest Game',
              games: games),
          )
            



          ],
        )
      )
    );
  }
}