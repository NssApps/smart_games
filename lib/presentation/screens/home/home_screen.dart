

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/presentation/providers/games/games_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(gamesProvider.notifier).getGames();

  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      
      

      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Home', style: TextStyle(color: Colors.white),),
          ),
        ],
        body: CustomScrollView(
          slivers: [

            SliverGrid.builder(
              
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
          itemBuilder: (context, index) {
          // final Ingredient ingredient = ingredients[index];
                // return IngredientCard(ingredient: ingredient);
                return FadeInUp(
      child: GestureDetector(
        onTap: () => null,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://insightglobal.com/wp-content/uploads/2022/10/headshot-1024x683.jpg',

            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress != null) {
                return const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12),
                );
              }
              
              return FadeIn(child: child);
            },
          ),
        ),
      ),
    );
          },)
            



          ],
        )
      )
    );
  }
}