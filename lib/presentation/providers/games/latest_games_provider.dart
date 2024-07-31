
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/domain/repositories/games_repository.dart';
import 'package:smart_games/infrastructure/datasources/games_datasource_impl.dart';
import 'package:smart_games/infrastructure/repositories/games_repository_impl.dart';

final latestGamesProvider = StateNotifierProvider<GamesNotifier, List<Game>>((ref) {
  final gamesRepository = GamesRepositoryImpl(datasource: GamesDatasourceImpl());
  return GamesNotifier(gamesRepository: gamesRepository);
});

class GamesNotifier extends StateNotifier<List<Game>> {
  final GamesRepository gamesRepository;
 
  GamesNotifier({required this.gamesRepository,  }) : super([]);

  Future<void> getLatestGames() async {
    final List<Game> games;
    games = await gamesRepository.getLatestGames();
    state = games;
  }

}