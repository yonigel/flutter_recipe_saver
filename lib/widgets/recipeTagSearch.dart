import 'package:flutter/material.dart';

class RecipeTagSearch extends StatefulWidget {
  @override
  _RecipeTagSearchState createState() => _RecipeTagSearchState();
}

class _RecipeTagSearchState extends State<RecipeTagSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [Text('Search By Tags')],
      ),
    );
  }
}
