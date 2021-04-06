import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:integral/UI/widget/loader.dart';
import 'package:integral/blocs/update_bloc/update_bloc.dart';
import 'package:integral/models/order_deleter.dart';
import 'package:integral/models/updater.dart';
import 'package:integral/services/injector.dart';

class ScreenWithUpdater<DataType> extends StatefulWidget {
  final Updater<DataType> updater;
  final Widget Function(BuildContext context, DataType type,
      VoidCallback delete, VoidCallback update) bodyBuilder;
  final Duration updatePeriod;
  final OrderDeleter deleter;

  const ScreenWithUpdater(
      {Key key,
      @required this.updater,
      @required this.bodyBuilder,
      @required this.updatePeriod,
      this.deleter})
      : super(key: key);
  @override
  _ScreenWithUpdaterState createState() => _ScreenWithUpdaterState<DataType>();
}

class _ScreenWithUpdaterState<DataType>
    extends State<ScreenWithUpdater<DataType>> {
  UpdateBloc<DataType> _bloc;
  VoidCallback delete;
  VoidCallback update;

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
      deleter: widget.deleter,
    );
    delete = _bloc.delete;
    update = _bloc.update;
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      cubit: _bloc,
      listener: (context, state) {
        if (state is LeavePage) {
          Singletone().update();
          Navigator.of(context).pop();
        }
      },
      builder: (
        context,
        state,
      ) {
        if (state is LeavePage) {
          return Center();
        }
        if (state is ShowLoader) {
          return LoaderWidget();
        } else if (state is UpdateMainState) {
          return widget.bodyBuilder(context, state.data, delete, update);
        } else {
          return Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}
