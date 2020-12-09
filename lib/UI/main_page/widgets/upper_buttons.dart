import 'package:flutter/material.dart';
import 'package:integral/UI/cart_screen/cart_screen.dart';
import 'package:integral/entities/cart.dart';
import 'package:integral/services/responsive_size.dart';

class CartAppBarItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CartScreen(Cart.test())));
        },
        child: Container(
            height: ResponsiveSize.height(40),
            width: ResponsiveSize.width(35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).accentColor,
            ),
            child: Icon(
              Icons.shopping_cart,
              size: 20,
              color: Colors.white,
            )),
      ),
    );
  }
}
