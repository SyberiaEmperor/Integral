part of 'mainpage_bloc.dart';

@immutable
abstract class MainpageEvent {}

class Update extends MainpageEvent {}

class AddDishToCart extends MainpageEvent {
  final Dish dish;

  AddDishToCart(this.dish);
}
