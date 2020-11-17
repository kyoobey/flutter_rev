import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/models/meal.dart';

import '../widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {

	static const routeName = '/category-meals';

	final List<Meal> availableMeals;

	CategoryMealsScreen(this.availableMeals);

	@override
	_CategoryMealsScreenState createState() => _CategoryMealsScreenState();

}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

	String title;
	List<Meal> displayedMeals;

	@override
	void initState() {
		// ...
		super.initState();
	}

	@override
	void didChangeDependencies() {
		final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
		final id = routeArgs['id'];
		title = routeArgs['title'];

		displayedMeals = widget.availableMeals.where((meal) {
			return meal.categories.contains(id);
		}).toList();
	}

	void _removeMeal(String mealId) {
		setState(() {
			displayedMeals.removeWhere((meal) => meal.id == mealId);
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text(title)),
			body: ListView.builder(itemBuilder: (ctx, idx) {
				return MealItem(
					id: displayedMeals[idx].id,
					title: displayedMeals[idx].title,
					imageUrl: displayedMeals[idx].imageUrl,
					duration: displayedMeals[idx].duration,
					complexity: displayedMeals[idx].complexity,
					affordability: displayedMeals[idx].affordability,
					removeMealCallback: _removeMeal
				);
			}, itemCount: displayedMeals.length)
		);
	}

}
