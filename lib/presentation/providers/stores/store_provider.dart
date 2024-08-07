

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/store.dart';
import 'package:smart_games/domain/repositories/stores_repository.dart';
import 'package:smart_games/infrastructure/datasources/stores_datasource.impl.dart';
import 'package:smart_games/infrastructure/errors/custom_error.dart';
import 'package:smart_games/infrastructure/repositories/stores_repository_impl.dart';

final storeProvider = StateNotifierProvider.autoDispose<StoreNotifier, StoreState>((ref) {
  final storesRepository = StoresRepositoryImpl(datasource: StoresDatasourceImpl());
  return StoreNotifier(storesRepository: storesRepository);
});

class StoreNotifier extends StateNotifier<StoreState> {
  final StoresRepository storesRepository;

  StoreNotifier({
    required this.storesRepository,
  }): super( StoreState() );

  Future<void> getStore(String storeId) async {
    try {
      final Store store = await storesRepository.getStore(storeId);

      state = state.copyWith(
        store: store,
        errorMessage: ''
      );

    } on CustomError catch(e)  {
     // print(e.errorMessage);
      throw Exception();
    } 
    catch(e) {
      //print(e);
      throw Exception();
    }
  }

}


class StoreState {
  final Store? store;
  final String errorMessage;
  final bool isLoading;

  StoreState({
    this.store, 
    this.errorMessage = '',
    this.isLoading = false,
  });

  StoreState copyWith({
    Store? store,
    String? errorMessage
  }) => StoreState(
    store: store ?? this.store,
    errorMessage: errorMessage ?? this.errorMessage,
  );
  

}