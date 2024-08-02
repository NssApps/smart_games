import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/presentation/providers/tabs/main_tabs_selected_index_provider.dart';
import 'package:smart_games/presentation/screens/creator/creators_screen.dart';
import 'package:smart_games/presentation/screens/games/games_screen.dart';
import 'package:smart_games/presentation/screens/home/home_screen.dart';
import 'package:smart_games/presentation/widgets/custom_botton_navigationbar.dart';

class TabsSreen extends ConsumerWidget {
  const TabsSreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selectedIndex = ref.watch(tabsSelectedIndexProvider);
  
    const views = <Widget> [
      // HomeScreen(),
      Placeholder(),
      // GamesScreen(),
      Placeholder(),
      CreatorsScreen(),
      Placeholder(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: views,
      ),
      bottomNavigationBar:  const CustomBottomNavigationbar(),
    );
  }
}