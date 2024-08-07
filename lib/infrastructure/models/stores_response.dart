

import 'package:smart_games/domain/entities/store.dart';

class StoresResponse {
    final int? count;
    final String? next;
    final dynamic previous;
    final List<Store> results;

    StoresResponse({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory StoresResponse.fromJson(Map<String, dynamic> json) => StoresResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<Store>.from(json["results"].map((x) => Store.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}