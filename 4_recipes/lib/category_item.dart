import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {

	final String title;
	final Color color;

	CategoryItem(this.title, this.color);

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: const EdgeInsets.all(15),
			child: Text(this.title),
			decoration: BoxDecoration(
				gradient: LinearGradient(
					begin: Alignment.topLeft, end: Alignment.bottomRight,
					colors: [color.withOpacity(.7), color]
				),
				borderRadius: BorderRadius.circular(15)
			)
		);
	}

}
	



