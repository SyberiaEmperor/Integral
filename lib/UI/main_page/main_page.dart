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
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            child: Container(
                height: ResponsiveSize.height(40),
                width: ResponsiveSize.width(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).accentColor,
                ),
                child: Icon(
                  Icons.description,
                  size: 20,
                  color: Colors.white,
                )),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
              child: Container(
                  height: ResponsiveSize.height(40),
                  width: ResponsiveSize.width(35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).accentColor,
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 20,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            //UpperButtons(),
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
