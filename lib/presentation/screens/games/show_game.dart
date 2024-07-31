


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_games/domain/entities/game.dart';


class ShowGameScreen extends ConsumerStatefulWidget {
  final String gameId;

  const ShowGameScreen({super.key, required this.gameId, });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowGameScreenState();
}

class _ShowGameScreenState extends ConsumerState<ShowGameScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }

  @override
  Widget build(BuildContext context) {
    final Game? game = ref.watch(drinkProvider).drink;

    
    return Scaffold(
      body: 
        game == null ?
          const Center(child: CircularProgressIndicator(),)
        :
        CustomScrollView(
          slivers: [
            CustomSliverAppbar(
              title: drink.strDrink!, 
            background: Image.network(drink.strDrinkThumb!, fit: BoxFit.fill,),
            actions: [
              IconButton.filled(
                // color: Colors.amber,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black45,
                ),
                onPressed: () async {
                  // ref.read(localStorageRepositoryProvider).toggleFavorite(drink);

                  await ref.read(favoriteDrinksProvider.notifier).toggleFavorite(drink);

                  // Invalida el provider y lo regresa a su estado original
                  ref.invalidate(isFavoriteProvider(drink.idDrink));


                }, icon: ref.watch(isFavoriteProvider(drink.idDrink)).when(
                  loading: () => const CircularProgressIndicator(),
                  data: (isFavorite) => isFavorite
                  ? const Icon(Icons.favorite, color: Colors.red,)
                  :  
                  const Icon(Icons.favorite),
                  error: (_, __) => throw UnimplementedError()
                )
                
                
                //  Icon(Icons.favorite)
              )
            ],
          ),

          SliverToBoxAdapter(
            child: _DrinkAbout(drink: drink,),
          ),

          const SliverToBoxAdapter(child:  SizedBox(height: 10,)),

          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(drink.strInstructions ?? ''),
          )),


          const SliverToBoxAdapter(child:  SizedBox(height: 10,)),

          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Ingredients', style: textTheme.titleLarge,),
          )),

          _IngredientsList(ingredients: drink.ingredients ?? [],),

          const SliverToBoxAdapter(child:  SizedBox(height: 10,)),

          // SliverToBoxAdapter(child: HorizontalListView(drinks: drinksByCategory, title: 'Drinks with xxxxxx',)),

          const SliverToBoxAdapter(child:  SizedBox(height: 50,)),


        ],
      )
    );
    

    // return CupertinoPageScaffold(
    //   child: Stack(
    //     children: [
    //       // Background Image
    //       Positioned.fill(
    //         child: Image.network(
    //                 "https://images.pexels.com/photos/27328445/pexels-photo-27328445/free-photo-of-a-couple-holding-hands-in-front-of-a-brick-wall.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    //                 fit: BoxFit.cover,
    //               )
    //       ),
    //       // Cupertino Navigation Bar
    //       Positioned(
    //         left: 0,
    //         right: 0,
    //         child: CupertinoNavigationBar(
    //           middle: Text('My Cupertino App'),
    //           backgroundColor: Colors.transparent,
    //         ),
    //       ),
    //     ],
    //   ),
    // );

  }
}





