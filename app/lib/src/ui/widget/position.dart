import 'package:app/src/ui/widget/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/count/count_bloc.dart';
import '../../bloc/position/position_bloc.dart';
import '../../models/position_model.dart';
import '../../data/repository/position_repository.dart';
import '../../viewmodel/count_view_model.dart';
import '../../viewmodel/position_view_model.dart';

class Position extends StatefulWidget {
  const Position({super.key});

  @override
  State<Position> createState() => _PositionState();
}

class _PositionState extends State<Position> {
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
    PositionRepository positionRepository = PositionRepository();
    PositionViewModel positionViewModel = PositionViewModel(
      positionBloc: BlocProvider.of<PositionBloc>(context),
      positionRepository: positionRepository,
    );
    final int level = ModalRoute.of(context)!.settings.arguments as int;
    positionViewModel.init(level);
    CountViewModel countViewModel = CountViewModel(
      countBloc: BlocProvider.of<CountBloc>(context),
    );
    return BlocBuilder<PositionBloc, PositionModel>(
      builder: (BuildContext context, PositionModel state) {
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
                  Text(
                    state.list[0].position,
                    textScaleFactor: 4.5,
                  ),
                  Offstage(
                    offstage: true,
                    child: TextFormField(
                      autofocus: true,
                      focusNode: _focus,
                      controller: _textEditingController,
                      onChanged: (value) async {
                        if (!stopwatch.isRunning) {
                          stopwatch.start();
                        }
                        if (_textEditingController.text ==
                            state.list[0].position) {
                          await positionViewModel.next(level);
                          countViewModel.increment(1);
                        } else {
                          countViewModel.decrement();
                        }
                        _textEditingController.text = '';
                      },
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Text(
                state.list[1].position,
                textScaleFactor: 4.5,
                style: const TextStyle(color: Colors.grey),
              ),
            )
          ],
        );
      },
    );
  }
}
