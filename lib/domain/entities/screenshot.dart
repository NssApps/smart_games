

class ShortScreenshot {
    final int? id;
    final String? image;

    ShortScreenshot({
        this.id,
        this.image,
    });

    factory ShortScreenshot.fromJson(Map<String, dynamic> json) => ShortScreenshot(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}