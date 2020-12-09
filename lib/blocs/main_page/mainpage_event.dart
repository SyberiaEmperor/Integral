part of 'mainpage_bloc.dart';

@immutable
abstract class MainpageEvent {}

class Update extends MainpageEvent {}

class Search extends MainpageEvent {
  final String text;

  Search(this.text);
}

class ChangeCategory extends MainpageEvent {
  final Category category;

  ChangeCategory(this.category);
}

class AddDishToCart extends MainpageEvent {
  final Dish dish;

  AddDishToCart(this.dish);
}
