
import 'package:smart_games/domain/entities/store.dart';

class StoreModel {
    final int id;
    final String? url;
    final Store store;

    StoreModel({
        required this.id,
        required this.url,
        required this.store,
    });

    factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json["id"],
        url: json["url"],
        store: Store.fromJson(json["store"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "store": store.toJson(),
    };
}


