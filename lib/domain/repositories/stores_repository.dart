
import 'package:smart_games/domain/entities/store.dart';

abstract class StoresRepository  {
  Future<List<Store>> getStores();
  Future<Store> getStore(String storeId);
}