import 'package:flutter/material.dart';

import 'package:recipes/categories_screen.dart';


void main() => runApp(App());


class App extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'recipes',
			theme: ThemeData(
				primarySwatch: Colors.blue,
				visualDensity: VisualDensity.adaptivePlatformDensity,
			),
			home: CategoriesScreen()
		);
	}

}
