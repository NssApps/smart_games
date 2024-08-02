
import 'package:smart_games/domain/entities/creator.dart';

class CreatorResponse {
    final int count;
    final String next;
    final dynamic previous;
    final List<Creator> results;

    CreatorResponse({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory CreatorResponse.fromJson(Map<String, dynamic> json) => CreatorResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Creator>.from(json["results"].map((x) => Creator.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}