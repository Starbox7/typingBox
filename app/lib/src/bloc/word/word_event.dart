part of 'word_bloc.dart';

abstract class WordEvent {}

class WordInitEvent extends WordEvent {
  List<Word> list;
  WordInitEvent({required this.list});
}

class WordNextEvent extends WordEvent {
  Word next;
  WordNextEvent({required this.next});
}
