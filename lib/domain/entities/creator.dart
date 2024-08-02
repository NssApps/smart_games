

import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/domain/entities/position.dart';

class Creator {
    final int id;
    final String name;
    final String slug;
    final String image;
    final String imageBackground;
    final int gamesCount;
    final List<Position> positions;
    final List<Game> games;

    Creator({
        required this.id,
        required this.name,
        required this.slug,
        required this.image,
        required this.imageBackground,
        required this.gamesCount,
        required this.positions,
        required this.games,
    });

    factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        imageBackground: json["image_background"],
        gamesCount: json["games_count"],
        positions: List<Position>.from(json["positions"].map((x) => Position.fromJson(x))),
        games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "image_background": imageBackground,
        "games_count": gamesCount,
        "positions": List<Position>.from(positions.map((x) => x.toJson())),
        "games": List<Game>.from(games.map((x) => x.toJson())),
    };
}