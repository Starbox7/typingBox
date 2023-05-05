part of 'position_bloc.dart';

abstract class PositionEvent {}

class PositionInitEvent extends PositionEvent {
  List<Position> list;
  PositionInitEvent({required this.list});
}

class PositionNextEvent extends PositionEvent {
  Position next;
  PositionNextEvent({required this.next});
}
