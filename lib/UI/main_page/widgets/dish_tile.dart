import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:integral/UI/dish_screen/dish_screen.dart';
import 'package:integral/models/dish.dart';
import 'package:integral/services/responsive_size.dart';

class DishTile extends StatelessWidget {
  final Dish dish;

  const DishTile(this.dish);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DishScreen(dish)));
        },
        child: Container(
          //color: Colors.black,
          width: ResponsiveSize.width(330),
          height: ResponsiveSize.height(120),
          child: Stack(
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: ResponsiveSize.width(280),
                  height: ResponsiveSize.height(120),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ResponsiveSize.height(10)),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: ResponsiveSize.height(15.08),
                      bottom: ResponsiveSize.height(16.92),
                    ),
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(dish.url),
                      radius: ResponsiveSize.width(50.43),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: ResponsiveSize.width(103),
                        child: Text(
                          dish.name,
                          style: Theme.of(context).accentTextTheme.bodyText2,
                        ),
                      ),
                      SizedBox(height: ResponsiveSize.height(6)),
                      Container(
                        width: ResponsiveSize.width(100),
                        height: ResponsiveSize.height(16),
                        child: Text(
                          dish.description,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).accentTextTheme.bodyText1,
                        ),
                      ),
                      SizedBox(height: ResponsiveSize.height(16)),
                      Container(
                        width: ResponsiveSize.width(61),
                        child: Text(
                          "${dish.price}Р",
                          style: Theme.of(context).accentTextTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: ResponsiveSize.width(45.5)),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: ResponsiveSize.width(56),
                      height: ResponsiveSize.height(40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ResponsiveSize.height(10)),
                            bottomRight:
                                Radius.circular(ResponsiveSize.height(10))),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: ResponsiveSize.height(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> dishesCards(List<Dish> dishes) {
  List<Widget> items = [];

  for (var dish in dishes) {
    items.add(Padding(
      padding: EdgeInsets.only(
        //right: ResponsiveSize.width(17.58),
        left: ResponsiveSize.width(20),
      ),
      child: DishTile(dish),
    ));
    items.add(SizedBox(height: 10));
  }

  return items;
}
