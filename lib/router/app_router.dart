

import 'package:go_router/go_router.dart';
import 'package:smart_games/presentation/screens/creator/show_creator.dart';
import 'package:smart_games/presentation/screens/games/show_game.dart';
import 'package:smart_games/presentation/screens/stores/show_store_screen.dart';
import 'package:smart_games/presentation/screens/tabs/tabs_screen.dart';
import 'package:smart_games/presentation/screens/web_viewer/web_viewer_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/tabs',
  routes: [
    GoRoute(
      path: '/tabs',
      name: 'tabs',
      builder: (context, state) => const TabsSreen(),
    ),
    GoRoute(
      path: '/games/:id',
      name: 'games',
        builder: (context, state) {
        final String gameId = state.pathParameters['id'] ?? 'no-id';
        return ShowGameScreen(gameId: gameId);
      },
    ),
    GoRoute(
      path: '/creators/:id',
      name: 'creators',
        builder: (context, state) {
        final String creatorId = state.pathParameters['id'] ?? 'no-id';
        return ShowCreator(creatorId: creatorId);
      },
    ),
    GoRoute(
      path: '/stores/:id',
      name: 'stores',
        builder: (context, state) {
        final String storeId = state.pathParameters['id'] ?? 'no-id';
        return ShowStoreScreen(storeId: storeId);
      },
    ),

    GoRoute(
      path: '/webViewer/:url/:name',
      name: 'webViewer',
      builder: (context, state) {
          final String url = state.pathParameters['url'] ?? 'no-id';
          final String storeName = state.pathParameters['name'] ?? 'no-id';
          return WebViewerScreen(url: url, title: storeName);
        },
    ),

    // GoRoute(
    //   path: '/drinks/ingredients/:name',
    //   name: 'drinksByIngredient',
    //       builder: (context, state) {
    //       final String ingredientName = state.pathParameters['name'] ?? 'no-id';
    //       return DrinksByIngredientScreen(ingredientName: ingredientName);
    //     },
    // ),
  
   


]);