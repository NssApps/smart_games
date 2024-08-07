

import 'package:smart_games/domain/datasources/stores_datasource.dart';
import 'package:smart_games/domain/entities/store.dart';
import 'package:smart_games/domain/repositories/stores_repository.dart';

class StoresRepositoryImpl extends StoresRepository {
  final StoresDatasource datasource;

  StoresRepositoryImpl({required this.datasource});

  @override
  Future<Store> getStore(String storeId) {
    return datasource.getStore(storeId);
  }

  @override
  Future<List<Store>> getStores() {
    return datasource.getStores();
  }

}