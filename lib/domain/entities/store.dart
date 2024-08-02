

class Store {
    final int id;
    final String name;
    final String slug;
    final String? domain;
    final int gamesCount;
    final String imageBackground;

    Store({
        required this.id,
        required this.name,
        required this.slug,
        required this.domain,
        required this.gamesCount,
        required this.imageBackground,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        domain: json["domain"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
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