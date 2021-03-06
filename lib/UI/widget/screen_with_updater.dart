import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/UI/default_pages/loading_page.dart';
import 'package:integral/blocs/update_bloc/update_bloc.dart';
import 'package:integral/models/updater.dart';

class ScreenWithUpdater<DataType> extends StatefulWidget {
  final Updater<DataType> updater;
  final Function<Widget>(DataType) bodyBuilder;

  const ScreenWithUpdater({Key key, this.updater, this.bodyBuilder})
      : super(key: key);
  @override
  _ScreenWithUpdaterState createState() => _ScreenWithUpdaterState();
}

class _ScreenWithUpdaterState extends State<ScreenWithUpdater> {
  UpdateBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = UpdateBloc(widget.updater);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateBloc, UpdateState>(builder: (
      ctx,
      state,
    ) {
      if (state is ShowLoader) {
        return LoadingPage();
      }
      if (state is UpdateMainState) return widget.bodyBuilder(state.data);
    });
  }
}
