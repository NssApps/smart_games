

import 'package:smart_games/domain/datasources/creators_datasource.dart';
import 'package:smart_games/domain/entities/creator.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/domain/repositories/creators_repository.dart';

class CreatorsRepositoryImpl extends CreatorsRepository {
  final CreatorsDatasource datasource;

  CreatorsRepositoryImpl({required this.datasource});

  @override
  Future<List<Creator>> getCreators() {
    return datasource.getCreators();
  }

  @override
  Future<List<Game>> getGamesByCreator(String creatorId) {
    return datasource.getGamesByCreator(creatorId);
  }
  
  @override
  Future<Creator> getCreator(String creatorId) {
    return datasource.getCreator(creatorId);
  }

}