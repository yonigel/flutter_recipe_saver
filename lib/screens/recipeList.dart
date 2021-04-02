import 'package:flutter/material.dart';

class RecipeList extends StatelessWidget {
  final String title;
  final items = List<String>.generate(10000, (i) => "Item $i");

  RecipeList({Key key, this.title}) : super(key: key);

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
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${items[index]}'),
                );
              },
            )));
  }
}
