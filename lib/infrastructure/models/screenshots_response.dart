
import 'package:smart_games/domain/entities/screenshot.dart';

class ScreenshotsResponse {
    final int count;
    final dynamic next;
    final dynamic previous;
    final List<Screenshot> results;

    ScreenshotsResponse({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory ScreenshotsResponse.fromJson(Map<String, dynamic> json) => ScreenshotsResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Screenshot>.from(json["results"].map((x) => Screenshot.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<Screenshot>.from(results.map((x) => x.toJson())),
    };
}


