import 'package:flutter/material.dart';
import '../widgets/newRecipeButton.dart';
import '../widgets/recipeTagSearch.dart';
import '../widgets/recipeTextSearch.dart';
import '../widgets/getRecipeButton.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  var _recipeSearchText = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                title: Text('Recipes'),
                onTap: () {
                  Navigator.pushNamed(context, '/allRecipes');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: new ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: [
            Column(children: [
              RecipeTextSearch((text) => {_recipeSearchText = text}),
              RecipeTagSearch(),
              GetRecipeButton(() => {}),
              NewRecipeButton()
            ])
          ],
        )),
      ),
    );
  }
}
