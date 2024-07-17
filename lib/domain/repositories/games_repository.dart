

import 'package:smart_games/domain/entities/game.dart';

abstract class GamesRepository  {
  Future<List<Game>> getGames();
  Future<Game> getGame(String gameId);




}