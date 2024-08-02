
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/achievement.dart';
import 'package:smart_games/domain/repositories/games_repository.dart';
import 'package:smart_games/infrastructure/datasources/games_datasource_impl.dart';
import 'package:smart_games/infrastructure/repositories/games_repository_impl.dart';

final achievementsProvider = StateNotifierProvider<AchievementsNotifier, List<Achievement>>((ref) {
  final gamesRepository = GamesRepositoryImpl(datasource: GamesDatasourceImpl());
  return AchievementsNotifier(gamesRepository: gamesRepository);
});

class AchievementsNotifier extends StateNotifier<List<Achievement>> {
  final GamesRepository gamesRepository;
 
  AchievementsNotifier({required this.gamesRepository,  }) : super([]);

  Future<void> getAchievements(String gameId) async {
    final List<Achievement> achievements;
    achievements = await gamesRepository.getAchievements(gameId);
    state = achievements;
  }

}