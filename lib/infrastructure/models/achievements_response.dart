
import 'package:smart_games/domain/entities/achievement.dart';

class AchievementsResponse {
    final int count;
    final String next;
    final dynamic previous;
    final List<Achievement> results;

    AchievementsResponse({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory AchievementsResponse.fromJson(Map<String, dynamic> json) => AchievementsResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Achievement>.from(json["results"].map((x) => Achievement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<Achievement>.from(results.map((x) => x.toJson())),
    };
}
