import 'package:flutter/material.dart';
import 'package:revenue/pages/category_meals_page/category_meals_page.dart';
import 'package:revenue/pages/category_page/category_page.dart';
import 'package:revenue/utils/app_routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revenue',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
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
        AppRoutes.HOME: (ctx) => const CategoryPage(),
        AppRoutes.CATEGORY_MEALS: (ctx) => CategoryMealsPage(),
      },
    );
  }
}
