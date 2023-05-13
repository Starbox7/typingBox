import 'package:app/src/ui/widget/count.dart';
import 'package:app/src/ui/widget/short.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/count/count_bloc.dart';
import '../../viewmodel/count_view_model.dart';

class Shorts extends StatelessWidget {
  const Shorts({super.key});

  @override
  Widget build(BuildContext context) {
    CountViewModel countViewModel = CountViewModel(
      countBloc: BlocProvider.of<CountBloc>(context),
    );
    countViewModel.setShort();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: const [
        Flexible(flex: 1, child: Short()),
      ],
    );
  }
}
