import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/count_model.dart';

part 'count_event.dart';

class CountBloc extends Bloc<CountEvent, CountModel> {
  CountBloc()
      : super(CountModel(count: 0, max: 0, total: 0, category: Category.init)) {
    on<CountInitEvent>((CountInitEvent event, Emitter<CountModel> emit) =>
        emit(CountModel(count: 0, max: 0, total: 0, category: Category.init)));
    on<CountPositionEvent>(
        (CountPositionEvent event, Emitter<CountModel> emit) => emit(CountModel(
            count: 0, max: 100, total: 0, category: Category.position)));
    on<CountWordEvent>((CountWordEvent event, Emitter<CountModel> emit) => emit(
        CountModel(count: 0, max: 100, total: 0, category: Category.word)));
    on<CountShortEvent>((CountShortEvent event, Emitter<CountModel> emit) =>
        emit(
            CountModel(count: 0, max: 10, total: 0, category: Category.short)));
    on<CountInCrementTotalEvent>(
        (CountInCrementTotalEvent event, Emitter<CountModel> emit) => emit(
            CountModel(
                count: state.count + 1,
                max: state.max,
                total: state.total + event.total,
                category: state.category)));
    on<CountDecrementTotalEvent>(
        (CountDecrementTotalEvent event, Emitter<CountModel> emit) => emit(
            CountModel(
                count: state.count - 1,
                max: state.max,
                total: state.total,
                category: state.category)));
  }
}
