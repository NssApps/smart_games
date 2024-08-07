

import 'package:smart_games/domain/entities/game.dart';

class Store {
    final int id;
    final String name;
    final String slug;
    final String? domain;
    final String? description;
    final int? gamesCount;
    final String imageBackground;
    final List<Game>? games;

    Store({
        required this.id,
        required this.name,
        required this.slug,
        required this.domain,
        required this.description,
        required this.gamesCount,
        required this.imageBackground,
        required this.games,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        domain: json["domain"],
        description: json["description"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"] ?? 'https://www.arto.com/shopping//img/no_image_available.jpeg',
        games: json["games"] != null ? List<Game>.from(json["games"].map((x) => Game.fromJson(x))) : [],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "domain": domain,
        "games_count": gamesCount,
        "image_background": imageBackground,
    };
}