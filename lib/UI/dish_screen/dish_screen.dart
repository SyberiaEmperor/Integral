import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/UI/dish_screen/widgets/tag_field.dart';
import 'package:integral/UI/main_page/widgets/upper_buttons.dart';
import 'package:integral/UI/widget/back_button.dart';
import 'package:integral/UI/widget/count_field.dart';
import 'package:integral/blocs/cart_counter_bloc/cart_counter_bloc.dart'
    as cartCounter;
import 'package:integral/blocs/dish_page/dish_page_bloc.dart';
import 'package:integral/entities/dish.dart';
import 'package:integral/services/responsive_size.dart';

class DishScreen extends StatelessWidget {
  const DishScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<DishPageBloc>(context);
    var counterBloc = BlocProvider.of<cartCounter.CartCounterBloc>(context);

    void _decrement() {
      bloc.add(DecrementEvent());
      counterBloc.add(cartCounter.Update());
    }

    void _increment() {
      bloc.add(IncrementEvent());
      counterBloc.add(cartCounter.Update());
    }

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
        child: BlocBuilder(
          cubit: bloc,
          builder: (context, state) {
            if (state is DishPageMainState) {
              Dish dish = state.dish;
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                            dish.name,
                            style: TextStyle(fontSize: 21),
                          ),
                        ),
                        SizedBox(height: 20.height),
                        _PictureAndPrice(
                          dishPrice: dish.price,
                          picUrl: dish.url,
                          heroId: dish.hashCode.toString(),
                        ),
                        SizedBox(height: 20.height),
                        Text(
                          'Описание:\n\n${dish.description}',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 20.height),
                        Wrap(
                          children:
                              dish.categories.map((e) => TagField(e)).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Center(child: Text('Что-то пошло не так'));
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder(
        cubit: bloc,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15.height),
            child: _ButtonBar(
              leftFieldCallback: _decrement,
              rightFieldCallback: _increment,
              addToCartCallback: _increment,
              count: (state as DishPageMainState).count,
            ),
          );
        },
      ),
    );
  }
}

class _PictureAndPrice extends StatelessWidget {
  final String heroId;
  final String picUrl;
  final int dishPrice;

  const _PictureAndPrice(
      {@required this.picUrl, @required this.dishPrice, @required this.heroId});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Hero(
        tag: heroId,
        child: Container(
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
            Text('Цена', style: TextStyle(fontSize: 15)),
            Text(
              '$dishPrice руб.',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    ]);
  }
}

class _ButtonBar extends StatelessWidget {
  final int count;
  final void Function() leftFieldCallback;
  final void Function() rightFieldCallback;
  final void Function() addToCartCallback;

  const _ButtonBar(
      {@required this.leftFieldCallback,
      @required this.rightFieldCallback,
      @required this.addToCartCallback,
      @required this.count});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CountField.horizontal(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            count: count,
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
                'Добавить в корзину',
                style: Theme.of(context).accentTextTheme.button,
              )),
        ),
      ],
    );
  }
}
