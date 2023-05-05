import 'package:app/src/ui/widget/count_position.dart';
import 'package:app/src/ui/widget/keyboard.dart';
import 'package:app/src/utils/title_bar.dart';
import 'package:flutter/material.dart';

class Position extends StatelessWidget {
  const Position({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Flexible(flex: 2, child: CountPosition()),
            Flexible(flex: 3, child: Keyboard())
          ],
        ),
      ),
    );
  }
}
