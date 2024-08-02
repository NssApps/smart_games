

class Achievement {
    final int id;
    final String name;
    final String description;
    final String image;
    final String percent;

    Achievement({
        required this.id,
        required this.name,
        required this.description,
        required this.image,
        required this.percent,
    });

    factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        percent: json["percent"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "percent": percent,
    };
}
