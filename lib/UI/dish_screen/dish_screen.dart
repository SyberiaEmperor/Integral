import 'package:flutter/material.dart';
import 'package:integral/models/dish.dart';

class DishScreen extends StatelessWidget {
  final Dish _dish;

  const DishScreen(this._dish, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        actions: [
          RawMaterialButton(
            onPressed: null,
            child: Icon(Icons.shopping_basket),
          )
        ],
      ),
      body: Center(child: Text("Yup")),
    );
  }
}
