import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(
            secondary: Colors.amber,
          ),          
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyText2:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),

                // titleMedium: const TextStyle(
                //     fontSize: 15, fontFamily: 'RobotoCondensed'),
              )),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        '/category-meal': (context) => const CategoryMealsScreen(),
        '/meal-detail': (context) => const MealDetailScreen(),
        '/filters':(context) => const FiltersScreen(),
      },
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => const CategoriesScreen(),
      ),
    );
  }
}
