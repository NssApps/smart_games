

import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/domain/entities/position.dart';
import 'package:smart_games/domain/entities/rating.dart';

class Creator {
    final int id;
    final String name;
    final String slug;
    final String image;
    final String imageBackground;
    final String? description;
    final int gamesCount;
    final String? rating;
    final List<Position> positions;
    final List<Game> games;
    final List<Rating>? ratings;

    Creator({
        required this.id,
        required this.name,
        required this.slug,
        required this.image,
        required this.imageBackground,
        required this.description,
        required this.gamesCount,
        required this.rating,
        required this.positions,
        required this.games,
        required this.ratings,
    });

    factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        imageBackground: json["image_background"],
        description: json["description"],
        gamesCount: json["games_count"],
        rating: json["rating"],
        positions: json["positions"] != null ? List<Position>.from(json["positions"].map((x) => Position.fromJson(x))) : [],
        games: json["games"] != null ? List<Game>.from(json["games"].map((x) => Game.fromJson(x))) : [],
        ratings: json["ratings"] == null ? [] : List<Rating>.from(json["ratings"]!.map((x) => Rating.fromJson(x))),
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