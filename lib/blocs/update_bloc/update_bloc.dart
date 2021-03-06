import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:integral/models/updater.dart';
import 'package:meta/meta.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc<DataType> extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc(this.updater) : super(ShowLoader()) {
    update();
  }

  ///An implementation of updater interface. Need to update values
  Updater<DataType> updater;

  ///Runs update function of updater.
  void update() {
    add(RunUpdate._());
  }

  @override
  Stream<UpdateState> mapEventToState(
    UpdateEvent _,
  ) async* {
    var data = await updater.update();
    yield UpdateMainState(data);
  }
}
