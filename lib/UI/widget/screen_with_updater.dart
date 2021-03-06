import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/UI/default_pages/loading_page.dart';
import 'package:integral/UI/widget/loader.dart';
import 'package:integral/blocs/update_bloc/update_bloc.dart';
import 'package:integral/entities/api/order_from_api.dart';
import 'package:integral/models/updater.dart';

class ScreenWithUpdater<DataType> extends StatefulWidget {
  final Updater<DataType> updater;
  final Widget Function(BuildContext, FullOrder) bodyBuilder;
  final Duration updatePeriod;

  const ScreenWithUpdater({
    Key key,
    @required this.updater,
    @required this.bodyBuilder,
    @required this.updatePeriod,
  }) : super(key: key);
  @override
  _ScreenWithUpdaterState createState() => _ScreenWithUpdaterState();
}

class _ScreenWithUpdaterState extends State<ScreenWithUpdater> {
  UpdateBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = UpdateBloc(
      updatePeriod: widget.updatePeriod,
      updater: widget.updater,
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateBloc, UpdateState>(
      cubit: _bloc,
      builder: (
        ctx,
        state,
      ) {
        return LoaderWidget();
        // if (state is ShowLoader) {
        // } else if (state is UpdateMainState) {
        //   return widget.bodyBuilder(ctx, state.data);
        // } else {
        //   return Center(
        //     child: Text('Something went wrong'),
        //   );
        // }
      },
    );
  }
}
