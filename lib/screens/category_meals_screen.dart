import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/view/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  const CategoryMealsScreen({
    Key? key,
    // required this.categoryId, required this.categoryTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];
    final categoryMeals = dummyMeals
        .where((element) => element.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
