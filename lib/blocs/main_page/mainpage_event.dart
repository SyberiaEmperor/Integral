part of 'mainpage_bloc.dart';

@immutable
abstract class MainPageEvent {}

class Update extends MainPageEvent {}

class SearchEvent extends MainPageEvent {
  final String text;

  SearchEvent(this.text);
}

class ChangeCategory extends MainPageEvent {
  final Category category;

  ChangeCategory(this.category);
}

class AddDishToCart extends MainPageEvent {
  final Dish dish;

  AddDishToCart(this.dish);
}
