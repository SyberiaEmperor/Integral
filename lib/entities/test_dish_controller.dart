import 'package:integral/entities/dish.dart';
import 'package:integral/models/dish_controller.dart';

class TestDishController implements DishController {
  final List<Dish> _dishes;

  TestDishController(this._dishes);

  @override
  List<Dish> search(String text) {
    //TODO: Доделать поиск по другим полям
    return _dishes.where((dish) => dish.description.contains(text)).toList();
  }

  @override
  List<Dish> byCategory(Category category) {
    return _dishes.where((dish) => dish.categories.contains(category));
  }
}
