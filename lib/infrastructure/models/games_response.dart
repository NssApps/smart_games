
import 'package:smart_games/domain/entities/game.dart';

class GamesResponse {
    final int? count;
    final String? next;
    final dynamic previous;
    final List<Game> results;

    GamesResponse({
        this.count,
        this.next,
        this.previous,
        required this.results,
    });

    factory GamesResponse.fromJson(Map<String, dynamic> json) => GamesResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<Game>.from(json["results"]!.map((x) => Game.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

