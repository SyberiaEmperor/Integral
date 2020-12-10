part of 'dish_page_bloc.dart';

@immutable
abstract class DishPageEvent {}

class IncrementEvent extends DishPageEvent {}

class DecrementEvent extends DishPageEvent {}
