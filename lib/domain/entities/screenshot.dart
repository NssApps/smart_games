

class Screenshot {
    final int id;
    final String image;
    final int width;
    final int height;
    final bool isDeleted;

    Screenshot({
        required this.id,
        required this.image,
        required this.width,
        required this.height,
        required this.isDeleted,
    });

    factory Screenshot.fromJson(Map<String, dynamic> json) => Screenshot(
        id: json["id"],
        image: json["image"],
        width: json["width"],
        height: json["height"],
        isDeleted: json["is_deleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "width": width,
        "height": height,
        "is_deleted": isDeleted,
    };
}