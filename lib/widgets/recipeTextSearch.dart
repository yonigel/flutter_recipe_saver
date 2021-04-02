import 'package:flutter/material.dart';

typedef void StringCallback(String id);

class RecipeTextSearch extends StatefulWidget {
  final bool _isCorrect = false;
  StringCallback _onTap;
  RecipeTextSearch(this._onTap);
  @override
  _RecipeTextSearchState createState() => _RecipeTextSearchState();
}

class _RecipeTextSearchState extends State<RecipeTextSearch> {
  final textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    widget._onTap(textController.text);
    print("from child - text field: ${textController.text}");
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    textController.addListener(_printLatestValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Search By Text',
              )),
        ],
      ),
    );
  }
}
