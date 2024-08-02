

import 'package:smart_games/domain/entities/creator.dart';
import 'package:smart_games/domain/entities/game.dart';

abstract class CreatorsRepository {
  Future<List<Creator>> getCreators();
  Future<Creator> getCreator(String creatorId);
  Future<List<Game>> getGamesByCreator(String creatorId);
}