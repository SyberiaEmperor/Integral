import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:integral/models/dish.dart';
import 'package:integral/services/responsive_size.dart';

class DishScreen extends StatelessWidget {
  final Dish _dish;

  const DishScreen(this._dish, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).canvasColor,
          actions: [
            RawMaterialButton(
              onPressed: null,
              child: Icon(Icons.shopping_basket),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    _dish.name,
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                SizedBox(height: 20.height),
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
                        image: CachedNetworkImageProvider(
                          _dish.url,
                        ),
                      )),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
                        "${_dish.price} руб.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Описание:\n\n${_dish.description}",
                  softWrap: true,
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RawMaterialButton(
                    onPressed: null,
                    child: Text("Левая хуйня"),
                  ),
                  RawMaterialButton(
                    onPressed: null,
                    child: Text("Правая хуйня"),
                    fillColor: Colors.blue,
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
