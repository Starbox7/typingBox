import 'package:app/src/bloc/count/count_bloc.dart';

class CountViewModel {
  final CountBloc _countBloc;

  CountViewModel({required CountBloc countBloc}) : _countBloc = countBloc;

  void init() {
    _countBloc.add(CountInitEvent());
  }

  void setPosition() {
    _countBloc.add(CountPositionEvent());
  }

  void setWord() {
    _countBloc.add(CountWordEvent());
  }

  void setShort() {
    _countBloc.add(CountShortEvent());
  }

  void increment(int total) {
    _countBloc.add(CountInCrementTotalEvent(total: total));
  }

  void decrement() {
    _countBloc.add(CountDecrementTotalEvent());
  }
}
