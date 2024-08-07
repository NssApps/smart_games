
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/domain/repositories/games_repository.dart';
import 'package:smart_games/infrastructure/datasources/games_datasource_impl.dart';
import 'package:smart_games/infrastructure/repositories/games_repository_impl.dart';

final mainGamesProvider = StateNotifierProvider<MainGamesNotifier, List<Game>>((ref) {
  final gamesRepository = GamesRepositoryImpl(datasource: GamesDatasourceImpl());
  return MainGamesNotifier(gamesRepository: gamesRepository);
});

class MainGamesNotifier extends StateNotifier<List<Game>> {
  final GamesRepository gamesRepository;
 
  MainGamesNotifier({required this.gamesRepository,  }) : super([]);

  Future<void> getMainGames() async {
    final List<Game> games;
    games = await gamesRepository.getMainGames();
    state = games;
  }

}