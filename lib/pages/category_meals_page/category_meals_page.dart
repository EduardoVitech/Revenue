import 'package:flutter/material.dart';
import 'package:revenue/models/category/category.dart';
import 'package:revenue/models/meal/meal.dart';
import 'package:revenue/widgets/meal_item/meal_item.dart';

class CategoryMealsPage extends StatelessWidget {
  final List<Meal> meals;

  const CategoryMealsPage(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
