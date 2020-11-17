import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';


class FiltersScreen extends StatefulWidget {

	static const routeName = '/filters';

	final Map<String, bool> currentFilters;
	final Function saveFiltersCallback;

	FiltersScreen(this.currentFilters, this.saveFiltersCallback);

	@override
	_FiltersScreenState createState() => _FiltersScreenState();

}


class _FiltersScreenState extends State<FiltersScreen> {

	bool _glutenFree = false;
	bool _vegetarian = false;
	bool _vegan = false;
	bool _lactoseFree = false;

	@override
	initState() {
		_glutenFree = widget.currentFilters['gluten'];
		_lactoseFree = widget.currentFilters['lactose'];
		_vegan = widget.currentFilters['vegan'];
		_vegetarian = widget.currentFilters['vegetarian'];
		super.initState();
	}

	Widget _buildSwitchListTile(String title, String description, bool value, Function updateCallback) {
		return SwitchListTile(
			title: Text(title),
			value: value,
			subtitle: Text(description),
			onChanged: updateCallback
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Filters'),
				actions: [
					IconButton(
						icon: Icon(Icons.save),
						onPressed: () => widget.saveFiltersCallback({
							'gluten': _glutenFree,
							'lactose': _lactoseFree,
							'vegan': _vegan,
							'vegetarian': _vegetarian
						})
					)
				]
			),
			drawer: MainDrawer(),
			body: Column(children: [
				Container(
					padding: EdgeInsets.all(20),
					child: Text('Adjust your meal selection', style: Theme.of(context).textTheme.title)
				),
				Expanded(child: ListView(children: [
					_buildSwitchListTile(
						'Gluten Free', 'only include gluten free meals',
						_glutenFree, (val) => setState(() => _glutenFree = val)
					),
					_buildSwitchListTile(
						'Lactose Free', 'only include lactose free meals',
						_lactoseFree, (val) => setState(() => _lactoseFree = val)
					),
					_buildSwitchListTile(
						'Vegetarian', 'only include vegetarian meals',
						_vegetarian, (val) => setState(() => _vegetarian = val)
					),
					_buildSwitchListTile(
						'Vegan', 'only include Vegan meals',
						_vegan, (val) => setState(() => _vegan = val)
					)
				])),
				Center(child: Text('filters'))
			])
		);
	}

}
