import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/short.dart';
import '../../models/short_model.dart';

part 'short_event.dart';

class ShortBloc extends Bloc<ShortEvent, ShortModel> {
  ShortBloc() : super(ShortModel(list: [])) {
    on<ShortInitEvent>((ShortInitEvent event, Emitter<ShortModel> emit) =>
        emit(ShortModel(list: event.list)));
    on<ShortNextEvent>((ShortNextEvent event, Emitter<ShortModel> emit) =>
        emit(ShortModel(list: [state.list[1], event.next])));
  }
}
