

import 'package:go_router/go_router.dart';
import 'package:smart_games/presentation/screens/games/show_game.dart';
import 'package:smart_games/presentation/screens/tabs/tabs_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/tabs',
  routes: [
    GoRoute(
      path: '/tabs',
      name: 'tabs',
      builder: (context, state) => const TabsSreen(),
    ),
    // GoRoute(
    //   path: '/home',
    //   name: 'home',
    //   builder: (context, state) => const HomeScreen(),
    // ),
    // GoRoute(
    //   path: '/images/:id',
    //   name: 'images',
    //       builder: (context, state) {
    //       final String imageId = state.pathParameters['id'] ?? 'no-id';
    //       return ShowImageScreen(imageId: imageId);
    //     },
    // ),
    GoRoute(
      path: '/games/:id',
      name: 'games',
          builder: (context, state) {
          final String gameId = state.pathParameters['id'] ?? 'no-id';
          return ShowGameScreen(gameId: gameId);
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