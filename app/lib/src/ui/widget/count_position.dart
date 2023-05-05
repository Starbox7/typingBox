import 'package:app/src/ui/widget/count.dart';
import 'package:app/src/ui/widget/position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/count/count_bloc.dart';
import '../../viewmodel/count_view_model.dart';

class CountPosition extends StatelessWidget {
  const CountPosition({super.key});

  @override
  Widget build(BuildContext context) {
    CountViewModel countViewModel = CountViewModel(
      countBloc: BlocProvider.of<CountBloc>(context),
    );
    countViewModel.setPosition();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: const [
        Flexible(flex: 1, child: Count()),
        Flexible(flex: 2, child: Position())
      ],
    );
  }
}
