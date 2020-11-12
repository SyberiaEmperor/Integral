import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarketTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, bottom: 37),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 189,
                height: 20,
                child: Text(
                  "Общественное питание",
                  style: Theme.of(context).accentTextTheme.bodyText1,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 112,
                height: 20,
                child: Text(
                  "Интеграл",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
