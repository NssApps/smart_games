import 'package:smart_games/domain/entities/game.dart';

abstract class GamesDatasource  {
  Future<List<Game>> getGames();
  Future<Game> getGame(String gameId);




}


