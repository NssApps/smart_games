
import 'package:smart_games/domain/entities/achievement.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/domain/entities/screenshot.dart';

abstract class GamesRepository  {
  Future<List<Game>> getGames();
  Future<List<Game>> getMainGames();
  Future<List<Game>> getMostPopularGames();
  Future<List<Game>> getLatestGames();
  Future<Game> getGame(String gameId);
  Future<List<Screenshot>> getScreenshots(String gameId);
  Future<List<Achievement>> getAchievements(String gameId);
}