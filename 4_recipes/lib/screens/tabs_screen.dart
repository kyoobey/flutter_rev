import 'package:flutter/material.dart';
import 'package:recipes/widgets/category_item.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';


class TabsScreen extends StatefulWidget {

	final List<Meal> favoriteMeals;

	TabsScreen(this.favoriteMeals);

	@override
	_TabsScreenState createState() => _TabsScreenState();

}


class _TabsScreenState extends State<TabsScreen> {

	List<Map<String, Object>> _pages;

	int _selectedPageIndex = 0;

	void initState() {
		_pages = [
			{'page': CategoriesScreen(), 'title': 'Categories'},
			{'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'}
		];
	}

	void _selectPage(int index) {
		setState(() {
			_selectedPageIndex = index;
		});
	}

	@override
	Widget build(BuildContext context) {
		return DefaultTabController(length: 2, child: Scaffold(
			appBar: AppBar(
				title: Text(_pages[_selectedPageIndex]['title']),
			),
			drawer: MainDrawer(),
			body: _pages[_selectedPageIndex]['page'],
			bottomNavigationBar: BottomNavigationBar(
				onTap: _selectPage,
				backgroundColor: Theme.of(context).primaryColor,
				unselectedItemColor: Colors.white,
				selectedItemColor: Theme.of(context).accentColor,
				currentIndex: _selectedPageIndex,
				type: BottomNavigationBarType.shifting,
				items: [
					BottomNavigationBarItem(
						icon: Icon(Icons.category),
						title: Text('Categories'),
						backgroundColor: Theme.of(context).primaryColor
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.star),
						title: Text('Favorites'),
						backgroundColor: Theme.of(context).primaryColor
					)
				]
			)
		));
	}

}
