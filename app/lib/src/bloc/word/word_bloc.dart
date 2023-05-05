import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/word.dart';
import '../../models/word_model.dart';

part 'word_event.dart';

class WordBloc extends Bloc<WordEvent, WordModel> {
  WordBloc() : super(WordModel(list: [])) {
    on<WordInitEvent>((WordInitEvent event, Emitter<WordModel> emit) =>
        emit(WordModel(list: event.list)));
    on<WordNextEvent>((WordNextEvent event, Emitter<WordModel> emit) =>
        emit(WordModel(list: [state.list[1], event.next])));
  }
}
