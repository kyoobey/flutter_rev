import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/models/meal.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';


class CategoryMealsScreen extends StatelessWidget {

	static const routeName = '/category-meals';

	//final String id;
	//final String title;

	//CategoryMealsScreen(this.id, this.title);

	@override
	Widget build(BuildContext context) {
		final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
		final id = routeArgs['id'], title = routeArgs['title'];

		final meals = DUMMY_MEALS.where((meal) {
			return meal.categories.contains(id);
		}).toList();

		return Scaffold(
			appBar: AppBar(title: Text(title)),
			body: ListView.builder(itemBuilder: (ctx, idx) {
				//return Text(meals[idx].title);
				return MealItem(
					title: meals[idx].title,
					imageUrl: meals[idx].imageUrl,
					duration: meals[idx].duration,
					complexity: meals[idx].complexity,
					affordability: meals[idx].affordability
				);
			}, itemCount: meals.length)
		);
	}

}
