import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/entities/dish.dart';
import 'package:integral/models/cart_controller.dart';
import 'package:meta/meta.dart';

part 'mainpage_event.dart';
part 'mainpage_state.dart';

class MainpageBloc extends Bloc<MainpageEvent, MainpageState> {
  final CartController cartController;
  MainpageBloc(this.cartController) : super(MainpageInitial());

  @override
  Stream<MainpageState> mapEventToState(
    MainpageEvent event,
  ) async* {}
}
