
import 'package:smart_games/domain/entities/game.dart';
// import 'package:smart_games/domain/entities/platform.dart';
// import 'package:smart_games/domain/entities/requirements_en.dart';

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


/*

class AddedByStatus {
    final int? yet;
    final int? owned;
    final int? beaten;
    final int? toplay;
    final int? dropped;
    final int? playing;

    AddedByStatus({
        this.yet,
        this.owned,
        this.beaten,
        this.toplay,
        this.dropped,
        this.playing,
    });

    factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
        playing: json["playing"],
    );

    Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
    };
}

class EsrbRating {
    final int? id;
    final String? name;
    final String? slug;

    EsrbRating({
        this.id,
        this.name,
        this.slug,
    });

    factory EsrbRating.fromJson(Map<String, dynamic> json) => EsrbRating(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
    };
}



enum Language {
    ENG
}

final languageValues = EnumValues({
    "eng": Language.ENG
});

class ParentPlatform {
    final EsrbRating? platform;

    ParentPlatform({
        this.platform,
    });

    factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: json["platform"] == null ? null : EsrbRating.fromJson(json["platform"]),
    );

    Map<String, dynamic> toJson() => {
        "platform": platform?.toJson(),
    };
}










class Store {
    final int? id;
    final Genre? store;

    Store({
        this.id,
        this.store,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        store: json["store"] == null ? null : Genre.fromJson(json["store"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "store": store?.toJson(),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}

*/