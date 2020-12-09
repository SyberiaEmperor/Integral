import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/entities/dish.dart';
import 'package:integral/models/cart_controller.dart';
import 'package:integral/models/dish_controller.dart';
import 'package:meta/meta.dart';

part 'mainpage_event.dart';
part 'mainpage_state.dart';

class MainpageBloc extends Bloc<MainpageEvent, MainpageState> {
  final CartController cartController;
  final DishController dishController;
  List<Dish> _currentDishes;
  Category currentCategory;
  MainpageBloc({this.cartController, this.dishController})
      : super(MainpageInitial(dishController.byCategory(Category.all))) {
    currentCategory = Category.all;
    _currentDishes = dishController.byCategory(currentCategory);
  }

  @override
  Stream<MainpageState> mapEventToState(
    MainpageEvent event,
  ) async* {
    yield LoadingState();
    if (event is Update) {
      //TODO: ImplementServerUpdate
    }
    if (event is ChangeCategory) {
      currentCategory = event.category;
      _currentDishes = dishController.byCategory(currentCategory);
    }
    if (event is Search) {
      _currentDishes = dishController.search(event.text);
    }
    yield MainpageInitial(_currentDishes);
  }
}
