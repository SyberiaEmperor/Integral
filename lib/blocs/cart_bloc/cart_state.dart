part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class InitialCartState extends CartState {
  final Map<Dish, int> dishes;

  InitialCartState(this.dishes);
}

class LoadingState extends CartState {
  final String caption;

  LoadingState(this.caption);
}

class ExitState extends CartState {}
