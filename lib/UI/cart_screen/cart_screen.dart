import 'package:flutter/material.dart';
import 'package:integral/UI/cart_screen/widgets/dish_tile.dart';
import 'package:integral/models/cart.dart';

class CartScreen extends StatelessWidget {
  final Cart _cart;

  const CartScreen(this._cart);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          actions: [
            UnconstrainedBox(
              child: GestureDetector(
                onTap: () {
                  print("<<<Exit tapped.>>>");
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffFF6077),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFFF6077),
                      width: 0.5,
                    ),
                  ),
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                    size: 19,
                  ),
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Заказ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Количество позиций: ${_cart.totalCount} ",
                style: TextStyle(fontSize: 18),
              ),
              DishTile(
                _cart.dishes.entries.first.key,
                _cart.dishes.entries.first.value,
              ),
            ],
          ),
        ));
  }
}
