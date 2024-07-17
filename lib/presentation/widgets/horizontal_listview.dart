

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:smart_cocktails/domain/entities/drink.dart';
// import 'package:smart_cocktails/domain/entities/ingredient.dart';
// import 'package:smart_cocktails/presentation/screens/widgets/drink_card.dart';

// class HorizontalListView extends ConsumerWidget {
//   final List<Drink> drinks;
//   final String? title;
//   final VoidCallback? loadMore;

//   const HorizontalListView({
//     super.key,
//     required this.drinks,
//     required this.title,
//     this.loadMore,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
    
//     return SizedBox(
//       height: 260.0,
//       child: Column(
//         children: [
//           if(title != null)
//             _Title(title: title,),

//           Expanded(
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: drinks.length,
//               physics: const BouncingScrollPhysics(),
//               itemBuilder: (context, index) {
//                 final Drink drink = drinks[index];
            
//                 return DrinkCard(drink: drink,);
//               },
//             ),
//           ),

//         ],
//       ),
//     );
//   }
// }

// class _Title extends StatelessWidget {
//   final String? title;
//   final Ingredient? ingredient;

//   const _Title({super.key, required this.title, this.ingredient,});

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       padding: const EdgeInsets.only(top: 10),
//       child: Row(
//         children: [
//           if(title != null )
//             Text(title!, style: textTheme.titleLarge),

//           const Spacer(),
//           if(ingredient != null)
//             IconButton(onPressed: () => context.push('/drinks/ingredients/${ingredient!.strIngredient}'), icon: const Icon(Icons.chevron_right))

//         ],
//       ),
//     );
//   }
// }



