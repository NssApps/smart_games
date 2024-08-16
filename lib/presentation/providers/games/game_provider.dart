

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/domain/repositories/games_repository.dart';
import 'package:smart_games/infrastructure/datasources/games_datasource_impl.dart';
import 'package:smart_games/infrastructure/errors/custom_error.dart';
import 'package:smart_games/infrastructure/repositories/games_repository_impl.dart';

final gameProvider = StateNotifierProvider.autoDispose<GameNotifier, GameState>((ref) {
  final gamesRepository = GamesRepositoryImpl(datasource: GamesDatasourceImpl());
  return GameNotifier(gamesRepository: gamesRepository);
});

class GameNotifier extends StateNotifier<GameState> {
  final GamesRepository gamesRepository;

  GameNotifier({ 
    required this.gamesRepository,
  }): super( GameState() );

  Future<void> getGame(String gameId) async {
    try {
      final Game game = await gamesRepository.getGame(gameId);

      state = state.copyWith(
        game: game,
        errorMessage: ''
      );

    } on CustomError catch(e)  {
     // print(e.errorMessage);
      throw Exception();
    } 
    catch(e) {
      //print(e);
      throw Exception(e.toString());
    }
  }

}


class GameState {
  final Game? game;
  final String errorMessage;
  final bool isLoading;

  GameState({
    this.game, 
    this.errorMessage = '',
    this.isLoading = false,
  });

  GameState copyWith({
    Game? game,
    String? errorMessage
  }) => GameState(
    game: game ?? this.game,
    errorMessage: errorMessage ?? this.errorMessage,
  );
  

}