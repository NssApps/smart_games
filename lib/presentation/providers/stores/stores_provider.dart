
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/store.dart';
import 'package:smart_games/domain/repositories/stores_repository.dart';
import 'package:smart_games/infrastructure/datasources/stores_datasource.impl.dart';
import 'package:smart_games/infrastructure/repositories/stores_repository_impl.dart';

final storesProvider = StateNotifierProvider<StoresNotifier, List<Store>>((ref) {
  final storesRepository = StoresRepositoryImpl(datasource: StoresDatasourceImpl());
  return StoresNotifier(storesRepository: storesRepository);
});

class StoresNotifier extends StateNotifier<List<Store>> {
  final StoresRepository storesRepository;
 
  StoresNotifier({required this.storesRepository,  }) : super([]);

  Future<void> getStores() async {
    final List<Store> stores;
    stores = await storesRepository.getStores();
    state = stores;
  }

}