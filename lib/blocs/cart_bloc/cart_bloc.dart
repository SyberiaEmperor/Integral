import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:integral/entities/dish.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(CartState initialState) : super(initialState);

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is IncrementEvent) {}
    if (event is DecrementEvent) {}
    if (event is EraseEvent) {}
    if (event is PurchaseEvent) {}
  }
}
