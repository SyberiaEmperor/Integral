import 'package:integral/entities/dish.dart';

abstract class DishController {
  List<Dish> byCategory(Category category);
  List<Dish> search(String text);
  void updateDishes();
}
