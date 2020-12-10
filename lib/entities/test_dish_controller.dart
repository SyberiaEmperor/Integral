import 'package:integral/entities/dish.dart';
import 'package:integral/models/dish_controller.dart';

class TestDishController implements DishController {
  final List<Dish> _dishes = [
    Dish.testDish(),
    Dish.testDish2(),
    Dish.testDish3(),
    Dish.testDish(),
    Dish.testDish2(),
    Dish.testDish3(),
    Dish.testDish(),
    Dish.testDish2(),
    Dish.testDish3()
  ];

  @override
  List<Dish> search(String text) {
    //TODO: Доделать поиск по другим полям
    return _dishes.where((dish) => dish.description.contains(text)).toList();
  }

  @override
  List<Dish> byCategory(Category category) {
    if (category == Category.all) {
      return _dishes;
    }
    return _dishes.where((dish) => dish.containsCategory(category)).toList();
  }
}