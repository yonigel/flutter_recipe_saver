import 'package:flutter/material.dart';

class GetRecipeButton extends StatefulWidget {
  VoidCallback _onSearchClick;
  GetRecipeButton(this._onSearchClick);
  @override
  _GetRecipeButtonState createState() => _GetRecipeButtonState();
}

class _GetRecipeButtonState extends State<GetRecipeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
      onPressed: () {
        widget._onSearchClick();
      },
      child: const Text('Search!', style: TextStyle(fontSize: 20)),
    ));
  }
}
