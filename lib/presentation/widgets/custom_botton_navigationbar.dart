import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/presentation/providers/tabs/main_tabs_selected_index_provider.dart';

class CustomBottomNavigationbar extends ConsumerWidget {
  const CustomBottomNavigationbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tabsSelectedIndexProvider);
    return BottomNavigationBar(
      onTap: (value) => ref.read(tabsSelectedIndexProvider.notifier).state = value,
      type : BottomNavigationBarType.fixed,
      // unselectedItemColor: Colors.white60,
      // backgroundColor: Colors.black,
      elevation: 1,
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home)
          ),

          BottomNavigationBarItem(
          label: 'Games',
          icon: Icon(Icons.games_rounded)
          ),
  
          BottomNavigationBarItem(
          label: 'Creators',
          icon: Icon(Icons.groups_2_rounded)
          ),

          BottomNavigationBarItem(
          label: 'Stores',
          icon: Icon(Icons.storefront_outlined)
          ),
      ],

    );
  }
}