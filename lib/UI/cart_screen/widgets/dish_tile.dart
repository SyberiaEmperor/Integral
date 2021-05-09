import 'package:flutter/material.dart';
import 'package:integral/UI/order_observe_page/order_observe_page.dart';
import 'package:integral/UI/widget/count_field.dart';
import 'package:integral/entities/dish.dart';
import 'package:integral/services/responsive_size.dart';

class DishTile extends StatelessWidget {
  final Dish dish;
  final int count;
  final VoidCallback inc;
  final VoidCallback dec;

  const DishTile({
    @required this.dish,
    @required this.count,
    @required this.inc,
    @required this.dec,
  });

  Future<bool> askForDeleting(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Удалить блюдо из корзины?"),
              BottomButton(
                text: "Да",
                color: Colors.green,
                action: () {
                  Navigator.pop(context, true);
                },
              ),
              BottomButton(
                text: "Нет",
                color: Colors.red,
                action: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> decrement() async {
      bool shouldDelete = true;
      if (count == 1) {
        shouldDelete = await askForDeleting(context);
      }
      if (shouldDelete) {
        dec();
      }
    }

    return Align(
      child: GestureDetector(
        onTap: () {
          print('Tapped');
        },
        child: Container(
          width: ResponsiveSize.width(330),
          height: ResponsiveSize.height(120),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 2.0),
                    blurRadius: 3.0)
              ],
              borderRadius: BorderRadius.circular(ResponsiveSize.height(10)),
              gradient: LinearGradient(colors: [
                Theme.of(context).backgroundColor,
                Theme.of(context).accentColor
              ])),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  width: ResponsiveSize.width(280),
                  height: ResponsiveSize.height(120),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ResponsiveSize.height(10)),
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              OverContainerContent(dish),
              Align(
                alignment: Alignment(0.988, 0),
                child: CountField.vertical(
                  count: count,
                  inc: inc,
                  dec: decrement,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OverContainerContent extends StatelessWidget {
  final Dish dish;
  OverContainerContent(this.dish);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: ResponsiveSize.height(15.08),
            bottom: ResponsiveSize.height(16.92),
          ),
          child: CircleAvatar(
            radius: 44,
            backgroundImage: NetworkImage(dish.url),
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
                '${dish.price}Р',
                style: Theme.of(context).accentTextTheme.bodyText2,
              ),
            ),
          ],
        ),
        SizedBox(width: ResponsiveSize.width(45.5)),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(),
        ),
      ],
    );
  }
}
