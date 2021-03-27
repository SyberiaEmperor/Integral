import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integral/UI/cart_screen/widgets/dish_tile.dart';
import 'package:integral/entities/order_dish.dart';
import 'package:integral/services/responsive_size.dart';

class DishOrderTile extends StatelessWidget {
  final OrderDish orderDish;

  const DishOrderTile({Key key, @required this.orderDish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () {
          print('Tapped');
        },
        child: Container(
          width: ResponsiveSize.width(330),
          height: ResponsiveSize.height(120),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 2.0),
                    blurRadius: 3.0)
              ],
              borderRadius: BorderRadius.circular(ResponsiveSize.height(10)),
              gradient: LinearGradient(colors: [
                Theme.of(context).backgroundColor,
                Theme.of(context).accentColor
              ])),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  width: ResponsiveSize.width(280),
                  height: ResponsiveSize.height(120),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ResponsiveSize.height(10)),
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              OverContainerContent(orderDish.dish),
              Align(
                alignment: Alignment(0.915.width, 0),
                child: Text(
                  orderDish.quantity.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.height,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
