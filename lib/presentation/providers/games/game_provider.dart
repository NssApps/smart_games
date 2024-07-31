

import 'package:flutter_riverpod/flutter_riverpod.dart';

final drinkProvider = StateNotifierProvider.autoDispose<DrinkNotifier, DrinkState>((ref) {
  final drinksRepository = DrinksRepositoryImpl(datasource: DrinksDatasourceImpl());
  return DrinkNotifier(drinksRepository: drinksRepository);
});

class DrinkNotifier extends StateNotifier<DrinkState> {
  final DrinksRepository drinksRepository;
  bool isLoading;

  DrinkNotifier({
    required this.drinksRepository,
    this.isLoading = false,
  }): super( DrinkState() );

  Future<void>  getDrink(String drinkId) async {
    try {
      isLoading = true;
      final Drink drink = await drinksRepository.getDrinkById(drinkId);

      state = state.copyWith(
        drink: drink,
        errorMessage: ''
      );

      isLoading = false;

      
      
    } on CustomError catch(e)  {
     // print(e.errorMessage);
      throw Exception();
    } 
    catch(e) {
      //print(e);
      throw Exception();
    }
  }

  Future<List<Drink>> getDrinksByCategory(String categoryName) async {
    final List<Drink> drinks = await drinksRepository.getDrinksByCategory(categoryName);

    return drinks;
  }

}


class DrinkState {
  final Drink? drink;
  final String errorMessage;
  final bool isLoading;

  DrinkState({
    this.drink, 
    this.errorMessage = '',
    this.isLoading = false,
  });

  DrinkState copyWith({
    Drink? drink,
    String? errorMessage
  }) => DrinkState(
    drink: drink ?? this.drink,
    errorMessage: errorMessage ?? this.errorMessage,
  );
  

}