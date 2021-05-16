import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/UI/cart_screen/widgets/dish_tile.dart';
import 'package:integral/UI/widget/back_button.dart';
import 'package:integral/blocs/cart_bloc/cart_bloc.dart';
import 'package:integral/services/responsive_size.dart';
import 'package:integral/blocs/cart_counter_bloc/cart_counter_bloc.dart'
    as cartCounter;

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartBloc = BlocProvider.of<CartBloc>(context);
    var counterBloc = BlocProvider.of<cartCounter.CartCounterBloc>(context);

    return BlocConsumer<CartBloc, CartState>(listener: (context, state) {
      if (state is ExitState) {
        counterBloc.add(cartCounter.Update());
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      if (state is InitialCartState) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: 0,
            leading: BackButtonLeading(),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Заказ',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Количество позиций: ${cartBloc.cartController.totalCount} ',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 6,
                ),
                Expanded(
                  child: ListView(
                    children: state.dishes.entries
                        .map((pair) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: DishTile(
                                  dish: pair.key,
                                  count: pair.value,
                                  inc: () {
                                    cartBloc.add(IncrementEvent(pair.key));
                                    counterBloc.add(cartCounter.Update());
                                  },
                                  dec: () {
                                    cartBloc.add(DecrementEvent(pair.key));
                                    counterBloc.add(cartCounter.Update());
                                  }),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Итого:',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2.color,
                          fontFamily:
                              Theme.of(context).textTheme.bodyText2.fontFamily,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        cartBloc.cartController.getTotalPrice.toString() +
                            'руб',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('<<<Order>>>');
                    cartBloc.add(PurchaseEvent());
                  },
                  child: Container(
                    width: ResponsiveSize.width(200),
                    height: ResponsiveSize.width(52),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular((10)),
                          bottomLeft: Radius.circular((10))),
                    ),
                    child: Center(
                      child: Text(
                        'Заказать',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.width,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      if (state is LoadingState)
        return Center(child: CircularProgressIndicator());

      return Scaffold();
    });
  }
}
