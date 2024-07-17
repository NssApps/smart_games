
class RequirementsEn {
    final String? minimum;
    final String? recommended;

    RequirementsEn({
        this.minimum,
        this.recommended,
    });

    factory RequirementsEn.fromJson(Map<String, dynamic> json) => RequirementsEn(
        minimum: json["minimum"],
        recommended: json["recommended"],
    );

    Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "recommended": recommended,
    };
}