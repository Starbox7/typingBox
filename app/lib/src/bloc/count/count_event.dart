part of 'count_bloc.dart';

abstract class CountEvent {}

class CountInitEvent extends CountEvent {}

class CountPositionEvent extends CountEvent {}

class CountWordEvent extends CountEvent {}

class CountShortEvent extends CountEvent {}

class CountInCrementTotalEvent extends CountEvent {
  int total;
  CountInCrementTotalEvent({required this.total});
}

class CountDecrementTotalEvent extends CountEvent {}
