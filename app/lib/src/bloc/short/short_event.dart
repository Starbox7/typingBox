part of 'short_bloc.dart';

abstract class ShortEvent {}

class ShortInitEvent extends ShortEvent {
  List<Short> list;
  ShortInitEvent({required this.list});
}

class ShortNextEvent extends ShortEvent {
  Short next;
  ShortNextEvent({required this.next});
}
