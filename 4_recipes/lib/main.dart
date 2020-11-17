import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './models/category.dart';
import './models/meal.dart';
import './dummy_data.dart';


void main() => runApp(App());


class App extends StatefulWidget {

	@override
	_AppState createState() => _AppState();

}


class _AppState extends State<App> {

	Map<String, bool> _filters = {
		'gluten': false,
		'lactose': false,
		'vegan': false,
		'vegetarian': false,
	};

	List<Meal> _availableMeals = DUMMY_MEALS;
	List<Meal> _favoritesMeals = [];

	void _setFilters(Map<String, bool> data) {
		setState(() {
			_filters = data;
			_availableMeals = DUMMY_MEALS.where((meal) {
				if (_filters['gluten'] && !meal.isGlutenFree) {
					return false;
				} if (_filters['lactose'] && !meal.isLactoseFree) {
					return false;
				} if (_filters['vegan'] && !meal.isVegan) {
					return false;
				} if (_filters['vegetarian'] && !meal.isVegetarian) {
					return false;
				} return true;
			}).toList();
		});
	}

	void _toggleFavorite(String id) {
		final idx = _favoritesMeals.indexWhere((meal) => meal.id == id);
		if (idx >= 0) {
			setState(() {
				_favoritesMeals.removeAt(idx);
			});
		} else {
			setState(() {
				_favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
			});
		}
	}

	bool _isMealFavorite(String id) {
		return _favoritesMeals.any((meal) => meal.id == id);
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'recipes',
			theme: ThemeData(
				primarySwatch: Colors.pink,
				accentColor: Colors.amber,
				canvasColor: Color.fromRGBO(255,254,229,1),
				fontFamily: 'Raleway',
				textTheme: ThemeData.light().textTheme.copyWith(
					body1: TextStyle(color: Color.fromRGBO(20,51,51,1)),
					body2: TextStyle(color: Color.fromRGBO(20,51,51,1)),
					title: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold)
				),
				visualDensity: VisualDensity.adaptivePlatformDensity,
			),
			//home: CategoriesScreen(),
			initialRoute: '/',
			routes: {
				'/': (ctx) => TabsScreen(_favoritesMeals),
				CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
				MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
				FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters)
			},
			//onGenerateRoute: (settings) {
			//	print(settings.arguments);
			//	return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
			//},
			onUnknownRoute: (settings) {
				return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
			}
		);
	}

}
