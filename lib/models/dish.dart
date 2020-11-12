import 'package:flutter/material.dart';

class Dish {
  final String id;
  final String name;
  final String description;
  final Set<Category> _categories;
  final String url;
  final int price;

  List<String> get categories => _categories.map((e) => e.asString);

  Dish(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required Set<Category> categories,
      @required this.url,
      @required this.price})
      : _categories = categories;

  static testDish() {
    return Dish(
      categories: {
        Category.starter,
        Category.plate,
        Category.sauce,
        Category.salad,
        Category.drinks,
        Category.bread
      },
      description:
          "Восхитительное блюдо! Пальчики оближешь и попросишь ещё этих мягких французских булочек, да выпьешь чаю. Нужно ещё больше букв, потому опишу я наш проект: Два приложения. В одном ты контролируешь блюда, в другом же - делаешь заказы, смотришь, что там и как, какие блюда есть, а каких нет.",
      id: "1",
      name: "Тестовое блюдо",
      price: 1000,
      url:
          "https://www.koolinar.ru/all_image/recipes/130/130352/recipe_be413881-ec26-47e2-ac5e-ffc284f1586a_large.jpg",
    );
  }

  factory Dish.fromData(Map<String, dynamic> data) {
    Set<Category> categories =
        data["catedories"].map((number) => Category.values[number]).toList();
    return Dish(
      categories: categories,
      description: data['description'],
      url: data['url'],
      id: data['id'],
      name: data['name'],
      price: data['price'],
    );
  }
}

enum Category {
  starter,
  plate,
  salad,
  drinks,
  bread,
  sauce,
}

extension on Category {
  String get asString {
    switch (this) {
      case Category.starter:
        return "Первые блюда";
      case Category.plate:
        return "Вторые блюда";
      case Category.drinks:
        return "Напитки";
      case Category.bread:
        return "Хлеб";
      case Category.sauce:
        return "Соусы";
      case Category.salad:
        return "Салаты";
    }
    throw FormatException("Incorrect input data");
  }
}
