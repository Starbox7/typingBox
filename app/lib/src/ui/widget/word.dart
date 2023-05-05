import 'package:app/src/bloc/count/count_bloc.dart';
import 'package:app/src/bloc/word/word_bloc.dart';
import 'package:app/src/data/repository/word_repository.dart';
import 'package:app/src/models/word_model.dart';
import 'package:app/src/ui/widget/record.dart';
import 'package:app/src/viewmodel/count_view_model.dart';
import 'package:app/src/viewmodel/word_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Word extends StatefulWidget {
  const Word({super.key});

  @override
  State<Word> createState() => _WordState();
}

class _WordState extends State<Word> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _focus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    WordRepository wordRepository = WordRepository();
    WordViewModel wordViewModel = WordViewModel(
      wordBloc: BlocProvider.of<WordBloc>(context),
      wordRepository: wordRepository,
    );
    wordViewModel.init();
    CountViewModel countViewModel = CountViewModel(
      countBloc: BlocProvider.of<CountBloc>(context),
    );
    return BlocBuilder<WordBloc, WordModel>(
      builder: (BuildContext context, WordModel state) {
        if (state.list.isEmpty) {
          return const CircularProgressIndicator();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(state.list[0].word, textScaleFactor: 3),
                  TextFormField(
                    autofocus: true,
                    focusNode: _focus,
                    controller: _textEditingController,
                    textAlign: TextAlign.center,
                    onChanged: (value) async {
                      if (!stopwatch.isRunning) {
                        stopwatch.start();
                      }
                      if (_textEditingController.text == state.list[0].word) {
                        await wordViewModel.next();
                        countViewModel
                            .increment(_textEditingController.text.length);
                        _textEditingController.text = '';
                      }
                    },
                  )
                ],
              ),
            ),
            Flexible(
              child: Text(
                state.list[1].word,
                textScaleFactor: 3,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        );
      },
    );
  }
}
