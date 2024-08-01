
class Tag {
    final int id;
    final String name;
    final String slug;
    final String language;
    final int gamesCount;
    final String imageBackground;

    Tag({
        required this.id,
        required this.name,
        required this.slug,
        required this.language,
        required this.gamesCount,
        required this.imageBackground,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        language: json["language"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "language": language,
        "games_count": gamesCount,
        "image_background": imageBackground,
    };
}
