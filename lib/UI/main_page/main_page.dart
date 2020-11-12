import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integral/UI/main_page/widgets/categories.dart';
import 'package:integral/UI/main_page/widgets/market_title.dart';
import 'package:integral/UI/main_page/widgets/search.dart';
import 'package:integral/UI/main_page/widgets/upper_buttons.dart';

class MainPage extends StatelessWidget {
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
                  SliverAppBar(
                    backgroundColor: Theme.of(context).canvasColor,
                    expandedHeight: 150,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        children: [
                          MarketTitle(),
                          Search(),
                          Categories(),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(buildItems(10)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildItems(int count) {
    List<Widget> items = [];

    for (int i = 0; i < count; i++)
      items.add(Container(
        width: 100,
        height: 100,
        child: Text("Item$i"),
      ));

    return items;
  }
}
