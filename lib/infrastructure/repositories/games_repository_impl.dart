

import 'package:smart_games/domain/datasources/games_datasource.dart';
import 'package:smart_games/domain/entities/achievement.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/domain/entities/screenshot.dart';
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
  
  @override
  Future<List<Game>> getLatestGames() {
    return datasource.getLatestGames();
  }
  
  @override
  Future<List<Game>> getMostPopularGames() {
    return datasource.getMostPopularGames();
  }

  @override
  Future<List<Screenshot>> getScreenshots(String gameId) {
    return datasource.getScreenshots(gameId);
  }

  @override
  Future<List<Achievement>> getAchievements(String gameId) {
    return datasource.getAchievements(gameId);
  }
}