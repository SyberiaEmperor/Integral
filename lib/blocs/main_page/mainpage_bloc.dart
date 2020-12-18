import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/entities/dish.dart';
import 'package:integral/models/cart_controller.dart';
import 'package:integral/models/dish_controller.dart';
import 'package:meta/meta.dart';

part 'mainpage_event.dart';
part 'mainpage_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final CartController cartController;
  final DishController dishController;
  List<Dish> _currentDishes;
  Category currentCategory;
  MainPageBloc({this.cartController, this.dishController})
      : super(LoadingState()) {
    currentCategory = Category.all;
    //_currentDishes = dishController.byCategory(currentCategory);
  }

  @override
  Stream<MainPageState> mapEventToState(
    MainPageEvent event,
  ) async* {
    yield LoadingState();
    if (event is Update) {
      {
        await dishController.updateDishes();
        _currentDishes = dishController.byCategory(currentCategory);
      }
    } else if (event is ChangeCategoryEvent) {
      currentCategory = event.category;
      _currentDishes = dishController.byCategory(currentCategory);
    } else if (event is SearchEvent) {
      _currentDishes = dishController.search(event.text);
    } else if (event is AddDishToCartEvent) {
      await cartController.addToCart(event.dish);
    }
    yield MainPageInitialState(_currentDishes);
  }
}
