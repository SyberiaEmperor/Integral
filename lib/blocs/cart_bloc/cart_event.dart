part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class IncrementEvent extends CartEvent {
  final Dish dish;

  IncrementEvent(this.dish);
}

class DecrementEvent extends CartEvent {
  final Dish dish;

  DecrementEvent(this.dish);
}

class EraseEvent extends CartEvent {
  final Dish dish;

  EraseEvent(this.dish);
}

class PurchaseEvent extends CartEvent {}
