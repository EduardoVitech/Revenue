import 'package:flutter/material.dart';
import 'package:revenue/widgets/meal_item/meal_item.dart';

import '../../models/meal/meal.dart';

class FavoritePage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritePage(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma receita marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
