import 'package:app/src/bloc/count/count_bloc.dart';
import 'package:app/src/models/count_model.dart';
import 'package:app/src/ui/widget/finish_dialog.dart';
import 'package:app/src/ui/widget/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Count extends StatelessWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountBloc, CountModel>(
      builder: (BuildContext context, CountModel state) {
        int count = state.count;
        int max = state.max;
        if (0 != count && 0 != max && count == max) {
          stopwatch.stop();
          WidgetsBinding.instance.addPostFrameCallback(
            (Duration timeStamp) => showDialog<AlertDialog>(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) => const FinishDialog(),
            ),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('progress: $count/${state.max}', textScaleFactor: 1.5),
            const SizedBox(height: 10),
            const Record(),
          ],
        );
      },
    );
  }
}
