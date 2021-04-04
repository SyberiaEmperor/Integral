import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:integral/models/order_deleter.dart';
import 'package:integral/models/updater.dart';
import 'package:integral/services/requests.dart';
import 'package:meta/meta.dart';

part 'update_event.dart';
part 'update_state.dart';

///Runs [updater] every [updatePeriod]
class UpdateBloc<DataType> extends Bloc<UpdateEvent, UpdateState> {
  ///An implementation of updater interface. Need to update values
  final Updater<DataType> updater;

  final OrderDeleter deleter;

  ///Cycle time
  final Duration updatePeriod;

  Timer _updaterTimer;

  UpdateBloc(
      {@required this.updater, @required this.updatePeriod, this.deleter})
      : super(ShowLoader()) {
    _init();
  }

  void _init() {
    update();
    _updaterTimer = Timer.periodic(updatePeriod, (timer) {
      update();
    });
  }

  void delete() async {
    try {
      await deleter.deleteOrder();
      add(LeavePageEvent());
    } on RequestException catch (e) {
      print(e.message);
    }
  }

  @override
  Future<void> close() {
    _updaterTimer.cancel();
    return super.close();
  }

  ///Runs update function of updater.
  void update() {
    add(RunUpdate._());
  }

  @override
  Stream<UpdateState> mapEventToState(
    UpdateEvent event,
  ) async* {
    if (event is RunUpdate) {
      var data = await updater.update();
      yield UpdateMainState(data);
    }
    if (event is LeavePageEvent) {
      yield LeavePage();
    }
  }
}
