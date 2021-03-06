import 'package:flutter/material.dart';
import 'package:integral/UI/order_observe_page/widgets/order_dish_tile_list.dart';
import 'package:integral/UI/widget/back_button.dart';
import 'package:integral/entities/api/order_from_api.dart';
import 'package:integral/services/responsive_size.dart';

class OrderObservePage extends StatelessWidget {
  final FullOrder order;
  final VoidCallback delete;
  const OrderObservePage({Key key, @required this.order, @required this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle nameStyle =
        Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 25.height);
    TextStyle valueStyle =
        Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 25.height);
    TextStyle confirmedValueStyle =
        valueStyle.copyWith(color: order.confirmed ? Colors.green : Colors.red);
    String confirmedCaption = order.confirmed ? 'Оплачен' : 'Не оплачен';

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: NameValueMapOrderBox(
          name: 'Заказ:',
          value: '#${order.id}',
          nameStyle: nameStyle,
          valueStyle: valueStyle,
          alignment: MainAxisAlignment.start,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leading: BackButtonLeading(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NameValueMapOrderBox(
              name: 'Цена:',
              value: order.total.toStringAsFixed(2) + ' руб.',
              nameStyle: nameStyle,
              valueStyle: valueStyle,
            ),
            NameValueMapOrderBox(
              name: 'Дата:',
              value: order.creationDate,
              nameStyle: nameStyle,
              valueStyle: valueStyle,
            ),
            NameValueMapOrderBox(
              name: 'Статус:',
              value: confirmedCaption,
              nameStyle: nameStyle,
              valueStyle: confirmedValueStyle,
            ),
            Expanded(
              child: DishOrderList(
                dishes: order.dishes,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BottomButton(
            text: 'Оплатить',
            color: Colors.green,
            action: () => print("Оплатить заказ"),
          ),
          BottomButton(
            text: 'Отменить заказ',
            color: Colors.red,
            action: delete,
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final VoidCallback action;
  final String text;
  final Color color;

  const BottomButton(
      {Key key, this.action, @required this.text, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.height),
      child: GestureDetector(
          onTap: action,
          child: Container(
            alignment: Alignment.center,
            height: 50.height,
            width: 150.width,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular((10)),
              ),
            ),
            child: Text(text,
                style: Theme.of(context)
                    .accentTextTheme
                    .bodyText2
                    .copyWith(color: Colors.white)),
          )),
    );
  }
}

class NameValueMapOrderBox extends StatelessWidget {
  final String name;
  final String value;

  final TextStyle nameStyle;
  final TextStyle valueStyle;

  final MainAxisAlignment alignment;

  const NameValueMapOrderBox({
    Key key,
    @required this.name,
    @required this.value,
    this.nameStyle,
    this.valueStyle,
    this.alignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.width),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Text(name, style: nameStyle),
          SizedBox(
            width: 20.width,
          ),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
