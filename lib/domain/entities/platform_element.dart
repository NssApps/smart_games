
import 'package:smart_games/domain/entities/platform.dart';
import 'package:smart_games/domain/entities/requirements_en.dart';

class PlatformElement {
    final Platform? platform;
    final DateTime? releasedAt;
    final RequirementsEn? requirementsEn;

    PlatformElement({
        this.platform,
        this.releasedAt,
        this.requirementsEn,
    });

    factory PlatformElement.fromJson(Map<String, dynamic> json) => PlatformElement(
        platform: json["platform"] == null ? null : Platform.fromJson(json["platform"]),
        releasedAt: json["released_at"] == null ? null : DateTime.parse(json["released_at"]),
        requirementsEn: json["requirements_en"] == null ? null : RequirementsEn.fromJson(json["requirements_en"]),
    );

    Map<String, dynamic> toJson() => {
        "platform": platform?.toJson(),
        "released_at": "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}",
        "requirements_en": requirementsEn?.toJson(),
    };
}