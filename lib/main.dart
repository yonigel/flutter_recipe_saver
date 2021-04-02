import 'package:flutter/material.dart';
import './screens/homePage.dart';
import './screens/recipeList.dart';

// void main() => runApp(MyApp());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Recipe';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyHomePage(title: 'Home'),
        '/allRecipes': (context) => RecipeList(title: 'Recipe List'),
      },
    );
  }
}
