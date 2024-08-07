

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_games/config/constants/environment.dart';
import 'package:smart_games/config/helpers/human_format.dart';
import 'package:smart_games/domain/entities/game.dart';

class GameHorizontalListview extends StatefulWidget {
  final List<Game> games;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage; // funcion para cargar la proxima
  // pagina cuando llegue al final

  const GameHorizontalListview(
      {super.key,
      required this.games,
      this.title,
      this.subtitle,
      this.loadNextPage});

  @override
  State<GameHorizontalListview> createState() =>
      _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<GameHorizontalListview> {
  // el ScrollController nos permite saber en que punto estamos
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Cada vez que se llama a un listener hay que llamar a dispose para
    // dejar de escuchar los cambios cuando se salga de la pantalla
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      // 200 es la distancia de gracia en pixeles
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null)
            _Title(
              title: widget.title,
              subtitle: widget.subtitle,
            ),
          Expanded(
              child: ListView.builder(
            controller: scrollController,
            itemCount: widget.games.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInRight(
                child: GestureDetector(
                  child: _Slide(game: widget.games[index]),
                  // se usa push cuando se quiere que se regrese a la pagina
                  onTap: () => context.push('/games/${widget.games[index].id}'),
                )
              );
            },
          )),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Game game;

  const _Slide({required this.game});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen
          SizedBox(
            width: 250,
            height: 170,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                game.backgroundImage ?? Environment.imageNotAvailable,
                fit: BoxFit.cover,
                width: 250,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  }

                  return FadeIn(child: child);
                },
              ),
            ),
          ),

          const SizedBox(
            height: 5,
          ),

          // Title
          SizedBox(
            width: 250,
            child: Text(
              game.name ?? 'Name not available',
              maxLines: 2,
              style: textStyles.titleSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // rating
          SizedBox(
            width: 250,
            child: Row(
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
                // Cuando se usa el spacer el contenedor padre debe
                // tener u ancho fino, no puede ser infinito
                const Spacer(),
                // Text(
                //   HumanFormats.number(game.ratingsCount.toDouble(), 0),
                //   style: textStyles.bodySmall,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(
                  subtitle!,
                ))
        ],
      ),
    );
  }
}