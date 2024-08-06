
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/creator.dart';
import 'package:smart_games/domain/repositories/creators_repository.dart';
import 'package:smart_games/infrastructure/datasources/creators_datasource.impl.dart';
import 'package:smart_games/infrastructure/errors/custom_error.dart';
import 'package:smart_games/infrastructure/repositories/creators_repository_impl.dart';

final creatorProvider = StateNotifierProvider.autoDispose<CreatorNotifier, CreatorState>((ref) {
  final creatorsRepository = CreatorsRepositoryImpl(datasource: CreatorsDatasourceImpl());
  return CreatorNotifier(creatorsRepository: creatorsRepository);
});

class CreatorNotifier extends StateNotifier<CreatorState> {
  final CreatorsRepository creatorsRepository;

  CreatorNotifier({
    required this.creatorsRepository,
  }): super( CreatorState() );

  Future<void> getCreator(String cretorId) async {
    try {
      final Creator creator = await creatorsRepository.getCreator(cretorId);

      state = state.copyWith(
        creator: creator,
        errorMessage: ''
      );

    } on CustomError catch(e)  {
      throw Exception();
    } 
    catch(e) {
      throw Exception();
    }
  }

}


class CreatorState {
  final Creator? creator;
  final String errorMessage;
  final bool isLoading;

  CreatorState({
    this.creator, 
    this.errorMessage = '',
    this.isLoading = false,
  });

  CreatorState copyWith({
    Creator? creator,
    String? errorMessage
  }) => CreatorState(
    creator: creator ?? this.creator,
    errorMessage: errorMessage ?? this.errorMessage,
  );
  

}