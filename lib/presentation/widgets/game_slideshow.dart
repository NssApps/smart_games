

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:animate_do/animate_do.dart';
import 'package:smart_games/domain/entities/game.dart';

class GameSlideShow extends StatelessWidget {
  final List<Game> games;

  const GameSlideShow({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      height: 450,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        // pagination: SwiperPagination(
        //   margin: const EdgeInsets.only(top: 0),
        //   builder: DotSwiperPaginationBuilder(
        //     activeColor: Theme.of(context).colorScheme.primary,
        //     color: Theme.of(context).colorScheme.secondary
        //   )
        // ),
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];

          return _Slide(game: game);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Game game;

  const _Slide({super.key, required this.game});

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10)
        )
      ]
    );

    return Padding(padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            game.backgroundImage!,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {

              if(loadingProgress != null) {
                return const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12),
                );
              }

              return GestureDetector(
                onTap: () => context.push('/games/${game.id}'),
                child: FadeIn(child: child));
            },
          ),
        )
      ),
    );
  }
}