part of 'mainpage_bloc.dart';

@immutable
abstract class MainpageState {}

class MainpageInitial extends MainpageState {
  final List<Dish> dishes;

  MainpageInitial(this.dishes);
}

class LoadingState extends MainpageState {}
