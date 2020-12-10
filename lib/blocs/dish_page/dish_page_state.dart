part of 'dish_page_bloc.dart';

@immutable
abstract class DishPageState {}

class DishPageMainState extends DishPageState {
  final Dish dish;
  final int count;

  DishPageMainState({@required this.dish, @required this.count});
}

class LoadingState extends DishPageState {}
