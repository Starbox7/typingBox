import 'package:app/src/bloc/count/count_bloc.dart';
import 'package:app/src/bloc/short/short_bloc.dart';
import 'package:app/src/data/repository/short_repository.dart';
import 'package:app/src/models/short_model.dart';
import 'package:app/src/ui/widget/record.dart';
import 'package:app/src/viewmodel/count_view_model.dart';
import 'package:app/src/viewmodel/short_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Short extends StatefulWidget {
  const Short({super.key});

  @override
  State<Short> createState() => _ShortState();
}

class _ShortState extends State<Short> {
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
    ShortRepository shortRepository = ShortRepository();
    ShortViewModel shortViewModel = ShortViewModel(
      shortBloc: BlocProvider.of<ShortBloc>(context),
      shortRepository: shortRepository,
    );
    shortViewModel.init();
    CountViewModel countViewModel = CountViewModel(
      countBloc: BlocProvider.of<CountBloc>(context),
    );
    return BlocBuilder<ShortBloc, ShortModel>(
      builder: (BuildContext context, ShortModel state) {
        if (state.list.isEmpty) {
          return const CircularProgressIndicator();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Text(state.list[0].short, textScaleFactor: 2),
            ),
            Flexible(
              flex: 1,
              child: TextFormField(
                autofocus: true,
                focusNode: _focus,
                controller: _textEditingController,
                textAlign: TextAlign.center,
                onChanged: (value) async {
                  if (!stopwatch.isRunning) {
                    stopwatch.start();
                  }
                  if (_textEditingController.text == state.list[0].short) {
                    await shortViewModel.next();
                    countViewModel
                        .increment(_textEditingController.text.length);
                    _textEditingController.text = '';
                  }
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                'NEXT: ${state.list[1].short}',
                textScaleFactor: 2,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        );
      },
    );
  }
}
