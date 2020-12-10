import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:integral/entities/dish.dart';
import 'package:integral/models/cart_controller.dart';
import 'package:meta/meta.dart';

part 'dish_page_event.dart';
part 'dish_page_state.dart';

class DishPageBloc extends Bloc<DishPageEvent, DishPageState> {
  final CartController cartController;
  final Dish dish;
  DishPageBloc({@required this.cartController, @required this.dish})
      : super(
            DishPageMainState(dish: dish, count: cartController.countOf(dish)));

  @override
  Stream<DishPageState> mapEventToState(
    DishPageEvent event,
  ) async* {
    if (event is IncrementEvent) {
      await cartController.addToCart(dish);
    }
    if (event is DecrementEvent) {
      await cartController.decrementFromCart(dish);
    }
    yield DishPageMainState(dish: dish, count: cartController.countOf(dish));
  }
}
