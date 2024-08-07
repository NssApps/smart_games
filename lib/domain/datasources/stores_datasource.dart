

import 'package:smart_games/domain/entities/store.dart';

abstract class StoresDatasource  {
  Future<List<Store>> getStores();
  Future<Store> getStore(String storeId);
}