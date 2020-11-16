import 'package:flutter/material.dart';
import 'package:integral/services/responsive_size.dart';

class DishTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: ResponsiveSize.width(280),
              height: ResponsiveSize.height(120),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ResponsiveSize.height(10)),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: ResponsiveSize.height(15.08),
                  bottom: ResponsiveSize.height(16.92),
                ),
                child: Container(
                    margin: EdgeInsets.only(left: ResponsiveSize.width(11.9)),
                    width: ResponsiveSize.width(90.83),
                    height: ResponsiveSize.height(88),
                    child: CircleAvatar()),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: ResponsiveSize.width(113),
                    child: Text(
                      "Борщ с капусткой",
                      style: Theme.of(context).accentTextTheme.bodyText2,
                    ),
                  ),
                  SizedBox(height: ResponsiveSize.height(6)),
                  Text(
                    "Цена за 300г",
                    style: Theme.of(context).accentTextTheme.bodyText1,
                  ),
                  SizedBox(height: ResponsiveSize.height(16)),
                  Text(
                    "120Р",
                    style: Theme.of(context).accentTextTheme.bodyText2,
                  ),
                ],
              ),
              SizedBox(width: ResponsiveSize.width(56)),
              Container(
                height: ResponsiveSize.height(120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
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
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: ResponsiveSize.height(20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
