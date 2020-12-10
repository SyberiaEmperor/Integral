part of 'mainpage_bloc.dart';

@immutable
abstract class MainPageState {}

class MainPageInitialState extends MainPageState {
  final List<Dish> dishes;

  MainPageInitialState(this.dishes);
}

class LoadingState extends MainPageState {}
