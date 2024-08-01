
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/presentation/providers/games/games_provider.dart';

class GamesScreen extends ConsumerStatefulWidget {
  const GamesScreen({super.key});

  @override
  GamesScreenState createState() => GamesScreenState();
}

class GamesScreenState extends ConsumerState<GamesScreen> {

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
            heroTag: 'games',
            largeTitle: Text('Games', style: TextStyle(color: Colors.white),),
          ),
        ],
        body: CustomScrollView(
          slivers: [

            SliverGrid.builder(
              
              itemCount: games.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( 
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              maxCrossAxisExtent: MediaQuery.sizeOf(context).width / 2,
              childAspectRatio: 0.7
            ), 
              itemBuilder: (context, index) {
              final Game game = games[index];
                return FadeInUp(
                  child: GestureDetector(
                    onTap: () => context.push('/games/${game.id}'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        game.backgroundImage ?? 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
                                      
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if(loadingProgress != null) {
                            return const DecoratedBox(
                              decoration: BoxDecoration(color: Colors.black12),
                            );
                          }
                          
                          return FadeIn(child: child);
                        },
                      ),
                    ),
                  ),
                );
                },),
          ],
        )
      )
    );
  }
}