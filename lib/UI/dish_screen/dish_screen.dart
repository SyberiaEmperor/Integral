import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:integral/UI/dish_screen/widgets/tag_field.dart';
import 'package:integral/UI/main_page/widgets/upper_buttons.dart';
import 'package:integral/UI/widget/back_button.dart';
import 'package:integral/UI/widget/count_field.dart';
import 'package:integral/models/dish.dart';
import 'package:integral/services/responsive_size.dart';

class DishScreen extends StatelessWidget {
  final Dish _dish;

  const DishScreen(this._dish, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: BackButtonLeading(),
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).canvasColor,
        actions: [CartAppBarItem()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      _dish.name,
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  SizedBox(height: 20.height),
                  _PictureAndPrice(
                    dishPrice: _dish.price,
                    picUrl: _dish.url,
                  ),
                  SizedBox(height: 20.height),
                  Text(
                    "Описание:\n\n${_dish.description}",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 20.height),
                  Wrap(
                    children: _dish.categories.map((e) => TagField(e)).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _ButtonBar(
        leftFieldCallback: () => print("Decrement"),
        rightFieldCallback: () => print("Increment"),
        addToCartCallback: () => print("Add to cart"),
      ),
    );
  }
}

class _PictureAndPrice extends StatelessWidget {
  final String picUrl;
  final int dishPrice;

  const _PictureAndPrice({@required this.picUrl, @required this.dishPrice});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        height: 281.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(picUrl),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey[100], width: 0),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Цена", style: TextStyle(fontSize: 15)),
            Text(
              "${dishPrice} руб.",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    ]);
  }
}

class _ButtonBar extends StatelessWidget {
  final void Function() leftFieldCallback;
  final void Function() rightFieldCallback;
  final void Function() addToCartCallback;

  const _ButtonBar(
      {@required this.leftFieldCallback,
      @required this.rightFieldCallback,
      @required this.addToCartCallback});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CountField.horizontal(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            count: 12,
            inc: rightFieldCallback,
            dec: leftFieldCallback,
            color: Colors.black),
        GestureDetector(
          onTap: addToCartCallback,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                color: Theme.of(context).accentColor,
              ),
              child: Text(
                "Добавить в корзину",
                style: Theme.of(context).accentTextTheme.button,
              )),
        ),
      ],
    );
  }
}
