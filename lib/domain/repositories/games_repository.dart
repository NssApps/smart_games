

import 'package:smart_games/domain/entities/game.dart';

abstract class GamesRepository  {
  Future<List<Game>> getGames();
  Future<List<Game>> getMostPopularGames();
  Future<List<Game>> getLatestGames();
  Future<Game> getGame(String gameId);

}