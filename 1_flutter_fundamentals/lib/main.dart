
import 'package:flutter/material.dart';




// entry point 

void main() => runApp(App());

// void main() {
// 	runApp(App());
// }




// app code
class App extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: Center(child: Text(
					'flutter fundamentals',
					style: TextStyle(
						color: Color(0xffa6f6f1),
						fontSize: 20
					)
				)),
				backgroundColor: Color(0xff213e3b)
			)
		);
	}

}


