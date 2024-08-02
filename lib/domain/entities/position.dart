
class Position {
    final int id;
    final String name;
    final String slug;

    Position({
        required this.id,
        required this.name,
        required this.slug,
    });

    factory Position.fromJson(Map<String, dynamic> json) => Position(
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
