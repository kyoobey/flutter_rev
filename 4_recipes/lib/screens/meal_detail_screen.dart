import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';


class MealDetailScreen extends StatelessWidget {

	static const routeName = '/meal-detail';

	final Function toggleFavoriteCallback;
	final Function isFavoriteCheck;

	MealDetailScreen(this.toggleFavoriteCallback, this.isFavoriteCheck);

	Widget buildSectionTitle(BuildContext context, String text) {
		return Container(
			margin: EdgeInsets.symmetric(vertical: 10),
			child: Text(text, style: Theme.of(context).textTheme.title)
		);
	}
	Widget buildContainer(Widget child) {
		return Container(
			decoration: BoxDecoration(
				color: Colors.white,
				border: Border.all(color: Colors.grey),
				borderRadius: BorderRadius.circular(10)
			),
			margin: EdgeInsets.all(10),
			padding: EdgeInsets.all(10),
			height: 200,
			width: 300,
			child: child
		);
	}

	@override
	Widget build(BuildContext context) {
		final id = ModalRoute.of(context).settings.arguments as String;
		final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

		return Scaffold(
			appBar: AppBar(title: Text(meal.title)),
			body: SingleChildScrollView(child: Column(children: [
				Container(
					height: 300, width: double.infinity,
					child: Image.network(
						meal.imageUrl,
						fit: BoxFit.cover
					)
				),
				buildSectionTitle(context, 'Ingredients'),
				buildContainer(ListView.builder(
					itemBuilder: (ctx, index) => Card(
						color: Theme.of(ctx).accentColor,
						child: Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10), child: Text(meal.ingredients[index]))
					),
					itemCount: meal.ingredients.length
				)),
				buildSectionTitle(context, 'Steps'),
				buildContainer(ListView.builder(
					itemBuilder: (ctx, index) => Column(children: [
						ListTile(
							leading: CircleAvatar(child: Text('#${index+1}')),
							title: Text(meal.steps[index])
						),
						Divider()
					]),
					itemCount: meal.steps.length
				)),
			])),
			floatingActionButton: FloatingActionButton(
				child: Icon(isFavoriteCheck(id) ? Icons.star : Icons.star_border),
				onPressed: () => toggleFavoriteCallback(id)
			),
		);
	}

}
