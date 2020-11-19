import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../providers/product.dart';
import '../widgets/products_grid.dart';


class ProductsOverviewScreen extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('Shop')),
			body: ProductsGrid()
		);
	}

}
