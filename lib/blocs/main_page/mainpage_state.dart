part of 'mainpage_bloc.dart';

@immutable
abstract class MainPageState {}

class MainPageInitial extends MainPageState {
  final List<Dish> dishes;

  MainPageInitial(this.dishes);
}

class LoadingState extends MainPageState {}
