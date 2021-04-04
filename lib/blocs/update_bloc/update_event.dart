part of 'update_bloc.dart';

@immutable
abstract class UpdateEvent {}

class RunUpdate extends UpdateEvent {
  RunUpdate._();
}

class LeavePageEvent extends UpdateEvent {}
