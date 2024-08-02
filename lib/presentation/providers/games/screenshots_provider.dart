
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/screenshot.dart';
import 'package:smart_games/domain/repositories/games_repository.dart';
import 'package:smart_games/infrastructure/datasources/games_datasource_impl.dart';
import 'package:smart_games/infrastructure/repositories/games_repository_impl.dart';

final screenshotsProvider = StateNotifierProvider<ScreenshotsNotifier, List<Screenshot>>((ref) {
  final gamesRepository = GamesRepositoryImpl(datasource: GamesDatasourceImpl());
  return ScreenshotsNotifier(gamesRepository: gamesRepository);
});

class ScreenshotsNotifier extends StateNotifier<List<Screenshot>> {
  final GamesRepository gamesRepository;
 
  ScreenshotsNotifier({required this.gamesRepository,  }) : super([]);

  Future<void> getScreenshots(String gameId) async {
    final List<Screenshot> screenshots;
    screenshots = await gamesRepository.getScreenshots(gameId);
    state = screenshots;
  }

}