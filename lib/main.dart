import 'package:flutter/material.dart';
import 'package:revenue/data/dummy_data.dart';
import 'package:revenue/models/meal/meal.dart';
import 'package:revenue/models/settings/settings.dart';
import 'package:revenue/pages/category_meals_page/category_meals_page.dart';
import 'package:revenue/pages/category_page/category_page.dart';
import 'package:revenue/pages/meal_detail_page/meal_detail_page.dart';
import 'package:revenue/pages/settings_page/settings_page.dart';
import 'package:revenue/pages/tabs_page/tabs_page.dart';
import 'package:revenue/utils/app_routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revenue',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // ignore: deprecated_member_use
        accentColor: Colors.yellow,
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsPage(),
        AppRoutes.CATEGORY_MEALS: (ctx) => CategoryMealsPage(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailPage(),
        AppRoutes.SETTINGS: (ctx) => SettingsPage(settings, _filterMeals),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return const CategoryPage();
          },
        );
      },
    );
  }
}
