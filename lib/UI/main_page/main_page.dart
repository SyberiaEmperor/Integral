import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integral/UI/main_page/widgets/categories.dart';
import 'package:integral/UI/main_page/widgets/dish_tile.dart';
import 'package:integral/UI/main_page/widgets/market_title.dart';
import 'package:integral/UI/main_page/widgets/search.dart';
import 'package:integral/UI/main_page/widgets/upper_buttons.dart';
import 'package:integral/models/dish.dart';
import 'package:integral/services/responsive_size.dart';

class MainPage extends StatelessWidget {
  List<Dish> dishes = [
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            UpperButtons(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        MarketTitle(),
                      ],
                    ),
                  ),
                  SliverAppBar(
                    elevation: 0.0,
                    stretch: true,
                    collapsedHeight: ResponsiveSize.height(115),
                    expandedHeight: ResponsiveSize.height(115),
                    backgroundColor: Theme.of(context).backgroundColor,
                    flexibleSpace: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Search(),
                        SizedBox(height: ResponsiveSize.height(24)),
                        Categories(),
                        SizedBox(height: ResponsiveSize.height(26)),
                      ],
                    ),
                    pinned: true,
                    centerTitle: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(dishesCards(dishes)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
