
// import 'package:smart_games/domain/entities/genre.dart';
// import 'package:smart_games/domain/entities/platform_element.dart';
import 'package:smart_games/domain/entities/rating.dart';


class Game {
    final int? id;
    final String? slug;
    final String? name;
    final String? nameOriginal;
    final String? description;
    final DateTime? released;
    final DateTime? updated;
    final String? backgroundImage;
    final String? backgroundImageAdditional;
    final String? website;
    final double? rating;
    final int? ratingTop;
    final List<Rating>? ratings;
    // final Map<String, int>? reactions;
    // final int? added;
    // final AddedByStatus? addedByStatus;
    final int? playtime;
    final int? screenshotsCount;
    final int? moviesCount;
    final int? creatorsCount;
    final int? achievementsCount;
    final int? parentAchievementsCount;
    // final String? redditUrl;
    // final String? redditName;
    // final String? redditDescription;
    // final String? redditLogo;
    // final int? redditCount;
    // final int? twitchCount;
    final int? youtubeCount;
    final int? reviewsTextCount;
    final int? ratingsCount;
    final int? suggestionsCount;
    // final List<String>? alternativeNames;
    final String? metacriticUrl;
    final int? parentsCount;
    final int? additionsCount;
    final int? gameSeriesCount;
    final dynamic userGame;
    final int? reviewsCount;
    final String? saturatedColor;
    final String? dominantColor;
    final List<ParentPlatform>? parentPlatforms;
    final List<PlatformElement>? platforms;
    // final List<Store>? stores;
    final List<Developer>? developers;
    final List<Developer>? genres;
    final List<Developer>? tags;
    final List<Developer>? publishers;
    final EsrbRating? esrbRating;
    final dynamic clip;
    final String? descriptionRaw;

    Game({
        this.id,
        this.slug,
        this.name,
        this.nameOriginal,
        this.description,
        this.released,
        this.updated,
        this.backgroundImage,
        this.backgroundImageAdditional,
        this.website,
        this.rating,
        this.ratingTop,
        this.ratings,
        this.playtime,
        this.screenshotsCount,
        this.moviesCount,
        this.creatorsCount,
        this.achievementsCount,
        this.parentAchievementsCount,
        this.youtubeCount,
        this.reviewsTextCount,
        this.ratingsCount,
        this.suggestionsCount,
        this.metacriticUrl,
        this.parentsCount,
        this.additionsCount,
        this.gameSeriesCount,
        this.userGame,
        this.reviewsCount,
        this.saturatedColor,
        this.dominantColor,
        this.parentPlatforms,
        this.platforms,
        // this.stores,
        this.developers,
        this.genres,
        this.tags,
        this.publishers,
        this.esrbRating,
        this.clip,
        this.descriptionRaw,
    });

    factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        released: json["released"] == null ? null : DateTime.parse(json["released"]),
        updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        website: json["website"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: json["ratings"] == null ? [] : List<Rating>.from(json["ratings"]!.map((x) => Rating.fromJson(x))),
        playtime: json["playtime"],
        screenshotsCount: json["screenshots_count"],
        moviesCount: json["movies_count"],
        creatorsCount: json["creators_count"],
        achievementsCount: json["achievements_count"],
        parentAchievementsCount: json["parent_achievements_count"],
        youtubeCount: json["youtube_count"],
        reviewsTextCount: json["reviews_text_count"],
        ratingsCount: json["ratings_count"],
        suggestionsCount: json["suggestions_count"],
        metacriticUrl: json["metacritic_url"],
        parentsCount: json["parents_count"],
        additionsCount: json["additions_count"],
        gameSeriesCount: json["game_series_count"],
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        parentPlatforms: json["parent_platforms"] == null ? [] : List<ParentPlatform>.from(json["parent_platforms"]!.map((x) => ParentPlatform.fromJson(x))),
        platforms: json["platforms"] == null ? [] : List<PlatformElement>.from(json["platforms"]!.map((x) => PlatformElement.fromJson(x))),
        // stores: json["stores"] == null ? [] : List<Store>.from(json["stores"]!.map((x) => Store.fromJson(x))),
        developers: json["developers"] == null ? [] : List<Developer>.from(json["developers"]!.map((x) => Developer.fromJson(x))),
        genres: json["genres"] == null ? [] : List<Developer>.from(json["genres"]!.map((x) => Developer.fromJson(x))),
        tags: json["tags"] == null ? [] : List<Developer>.from(json["tags"]!.map((x) => Developer.fromJson(x))),
        publishers: json["publishers"] == null ? [] : List<Developer>.from(json["publishers"]!.map((x) => Developer.fromJson(x))),
        esrbRating: json["esrb_rating"] == null ? null : EsrbRating.fromJson(json["esrb_rating"]),
        clip: json["clip"],
        descriptionRaw: json["description_raw"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "name_original": nameOriginal,
        "description": description,
        "released": "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
        "updated": updated?.toIso8601String(),
        "background_image": backgroundImage,
        "background_image_additional": backgroundImageAdditional,
        "website": website,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "playtime": playtime,
        "screenshots_count": screenshotsCount,
        "movies_count": moviesCount,
        "creators_count": creatorsCount,
        "achievements_count": achievementsCount,
        "parent_achievements_count": parentAchievementsCount,
        "youtube_count": youtubeCount,
        "reviews_text_count": reviewsTextCount,
        "ratings_count": ratingsCount,
        "suggestions_count": suggestionsCount,
        "metacritic_url": metacriticUrl,
        "parents_count": parentsCount,
        "additions_count": additionsCount,
        "game_series_count": gameSeriesCount,
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "parent_platforms": parentPlatforms == null ? [] : List<dynamic>.from(parentPlatforms!.map((x) => x.toJson())),
        "platforms": platforms == null ? [] : List<dynamic>.from(platforms!.map((x) => x.toJson())),
        // "stores": stores == null ? [] : List<dynamic>.from(stores!.map((x) => x.toJson())),
        "developers": developers == null ? [] : List<dynamic>.from(developers!.map((x) => x.toJson())),
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "publishers": publishers == null ? [] : List<dynamic>.from(publishers!.map((x) => x.toJson())),
        "esrb_rating": esrbRating?.toJson(),
        "clip": clip,
        "description_raw": descriptionRaw,
    };
}

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

class Developer {
    final int? id;
    final String? name;
    final String? slug;
    final int? gamesCount;
    final String? imageBackground;
    final String? domain;
    final Language? language;

    Developer({
        this.id,
        this.name,
        this.slug,
        this.gamesCount,
        this.imageBackground,
        this.domain,
        this.language,
    });

    factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain: json["domain"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domain,
    };
}

enum Language {
    ENG
}

// final languageValues = EnumValues({
//     "eng": Language.ENG
// });

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

class PlatformElement {
    final PlatformPlatform? platform;
    final DateTime? releasedAt;
    final Requirements? requirements;

    PlatformElement({
        this.platform,
        this.releasedAt,
        this.requirements,
    });

    factory PlatformElement.fromJson(Map<String, dynamic> json) => PlatformElement(
        platform: json["platform"] == null ? null : PlatformPlatform.fromJson(json["platform"]),
        releasedAt: json["released_at"] == null ? null : DateTime.parse(json["released_at"]),
        requirements: json["requirements"] == null ? null : Requirements.fromJson(json["requirements"]),
    );

    Map<String, dynamic> toJson() => {
        "platform": platform?.toJson(),
        "released_at": "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}",
        "requirements": requirements?.toJson(),
    };
}

class PlatformPlatform {
    final int? id;
    final String? name;
    final String? slug;
    final dynamic image;
    final dynamic yearEnd;
    final dynamic yearStart;
    final int? gamesCount;
    final String? imageBackground;

    PlatformPlatform({
        this.id,
        this.name,
        this.slug,
        this.image,
        this.yearEnd,
        this.yearStart,
        this.gamesCount,
        this.imageBackground,
    });

    factory PlatformPlatform.fromJson(Map<String, dynamic> json) => PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
    };
}

class Requirements {
    final String? minimum;

    Requirements({
        this.minimum,
    });

    factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"],
    );

    Map<String, dynamic> toJson() => {
        "minimum": minimum,
    };
}

// class Rating {
//     final int? id;
//     final String? title;
//     final int? count;
//     final double? percent;

//     Rating({
//         this.id,
//         this.title,
//         this.count,
//         this.percent,
//     });

//     factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//         id: json["id"],
//         title: json["title"],
//         count: json["count"],
//         percent: json["percent"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "count": count,
//         "percent": percent,
//     };
// }

/*
class Store {
    final int? id;
    final String? url;
    final Developer? store;

    Store({
        this.id,
        this.url,
        this.store,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        url: json["url"],
        store: json["store"] == null ? null : Developer.fromJson(json["store"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
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