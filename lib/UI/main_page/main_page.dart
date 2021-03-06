import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/UI/main_page/widgets/categories.dart';
import 'package:integral/UI/main_page/widgets/dish_tile.dart';
import 'package:integral/UI/main_page/widgets/market_title.dart';
import 'package:integral/UI/main_page/widgets/search.dart';
import 'package:integral/UI/main_page/widgets/upper_buttons.dart';

import 'package:integral/UI/routes/orders_page_route.dart';
import 'package:integral/UI/widget/back_button.dart';
import 'package:integral/blocs/main_page/mainpage_bloc.dart';

import 'package:integral/entities/dish.dart';

import 'package:integral/services/responsive_size.dart';
import 'package:integral/services/sp_data_rep.dart';

class MainPage extends StatelessWidget {
  final TextEditingController search = TextEditingController();

  void unfocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    var mainBloc = BlocProvider.of<MainPageBloc>(context);

    return SafeArea(
      child: GestureDetector(
        onTap: () => unfocus(context),
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                elevation: 0.0,
                leading: ExitButton(
                  deleter: SpDataRepository(),
                ),
                actions: [
                  OrdersPageAppBarLeading(),
                  SizedBox(
                    width: 20,
                  ),
                  CartAppBarItem(),
                ],
              ),
              backgroundColor: Theme.of(context).backgroundColor,
              body: RefreshIndicator(
                onRefresh: () async {
                  mainBloc.add(
                    Update(),
                  );
                },
                child: BlocBuilder<MainPageBloc, MainPageState>(
                  builder: (context, state) {
                    if (state is MainPageInitialState) {
                      return Column(
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
                                  pinned: true,
                                  centerTitle: true,
                                  collapsedHeight: ResponsiveSize.height(115),
                                  expandedHeight: ResponsiveSize.height(115),
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  flexibleSpace: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Search(
                                        controller: search,
                                        onEditingComplete: () {
                                          mainBloc
                                              .add(SearchEvent(search.text));
                                        },
                                      ),
                                      SizedBox(
                                          height: ResponsiveSize.height(24)),
                                      Categories(
                                        categories: Category.values,
                                        selectedCategory: context
                                            .watch<MainPageBloc>()
                                            .currentCategory,
                                        onSelect: (category) {
                                          context.read<MainPageBloc>().add(
                                              ChangeCategoryEvent(category));
                                        },
                                      ),
                                      SizedBox(
                                          height: ResponsiveSize.height(26)),
                                    ],
                                  ),
                                ),
                                SliverList(
                                  delegate: SliverChildListDelegate(
                                      dishesCards(state.dishes, context)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is LoadingState) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Loading data...')
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
            /*Align(
              alignment: Alignment.topCenter,
              child: ExitButton(
                deleter: SpDataRepository(),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

class OrdersPageAppBarLeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            OrdersPageRoute(),
          );
        },
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
          ),
        ),
      ),
    );
  }
}
