

class Developer {
    final int? id;
    final String? name;
    final String? slug;
    final int? gamesCount;
    final String? imageBackground;
    final String? domain;

    Developer({
        this.id,
        this.name,
        this.slug,
        this.gamesCount,
        this.imageBackground,
        this.domain,
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