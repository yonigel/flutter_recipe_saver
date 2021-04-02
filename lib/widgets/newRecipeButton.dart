import 'package:flutter/material.dart';

class NewRecipeButton extends StatefulWidget {
  @override
  _NewRecipeButtonState createState() => _NewRecipeButtonState();
}

class _NewRecipeButtonState extends State<NewRecipeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {},
        child: const Text('Add New Recipe', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
