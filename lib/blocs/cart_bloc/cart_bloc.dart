import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:integral/entities/dish.dart';
import 'package:integral/models/cart_controller.dart';
import 'package:meta/meta.dart';
import 'package:pedantic/pedantic.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(CartState initialState, this.cartController) : super(initialState) {
    add(UpdateEvent());
  }

  final CartController cartController;

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is UpdateEvent) {
      yield InitialCartState(cartController.dishes);
    }
    if (event is IncrementEvent) {
      cartController.addToCart(event.dish);
      yield InitialCartState(cartController.dishes);
    }
    if (event is DecrementEvent) {
      cartController.decrementFromCart(event.dish);
      yield InitialCartState(cartController.dishes);
    }
    if (event is EraseEvent) {
      cartController.removeFromCart(event.dish);
      yield InitialCartState(cartController.dishes);
    }
    if (event is PurchaseEvent) {}
  }
}
