

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/creator.dart';
import 'package:smart_games/domain/repositories/creators_repository.dart';
import 'package:smart_games/infrastructure/datasources/creators_datasource.impl.dart';
import 'package:smart_games/infrastructure/repositories/creators_repository_impl.dart';

final creatorsProvider = StateNotifierProvider<CreatorsNotifier, List<Creator>>((ref) {
  final creatorsRepository = CreatorsRepositoryImpl(datasource: CreatorsDatasourceImpl());
  return CreatorsNotifier(creatorsRepository: creatorsRepository);
});

class CreatorsNotifier extends StateNotifier<List<Creator>> {
  final CreatorsRepository creatorsRepository;
 
  CreatorsNotifier({required this.creatorsRepository,  }) : super([]);

  Future<void> getCreators() async {
    final List<Creator> creators;
    creators = await creatorsRepository.getCreators();
    state = creators;
  }

}