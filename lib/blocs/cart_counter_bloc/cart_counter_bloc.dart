import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_counter_event.dart';
part 'cart_counter_state.dart';

class CartCounterBloc extends Bloc<CartCounterEvent, CartCounterState> {
  CartCounterBloc() : super(CartCounterInitial());

  @override
  Stream<CartCounterState> mapEventToState(
    CartCounterEvent event,
  ) async* {
    if (event is Update) {
      yield CartCounterInitial();
    }
  }
}
