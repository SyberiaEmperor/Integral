import 'package:flutter/material.dart';
import 'package:integral/blocs/cart_bloc/cart_bloc.dart' as cart;
import 'package:integral/entities/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/services/dio_order_tool.dart';

import '../../../services/responsive_size.dart';
import '../../cart_screen/cart_screen.dart';

class CartAppBarItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          var page = BlocProvider(
            create: (BuildContext context) => cart.CartBloc(
              cart.LoadingState("Загрузка"),
              DataRepository.cartController,
              DioOrderTool(),
            ),
            child: CartScreen(),
          );
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
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
          ),
        ),
      ),
    );
  }
}
