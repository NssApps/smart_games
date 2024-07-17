

import 'package:smart_games/domain/datasources/games_datasource.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/domain/repositories/games_repository.dart';

class GamesRepositoryImpl extends GamesRepository  {
  final GamesDatasource datasource;

  GamesRepositoryImpl({required this.datasource});

  @override
  Future<Game> getGame(String gameId) {
    return datasource.getGame(gameId);
  }

  @override
  Future<List<Game>> getGames() {
    return datasource.getGames();
  }
}