import 'package:app/src/ui/widget/shorts.dart';
import 'package:app/src/ui/widget/keyboard.dart';
import 'package:app/src/utils/title_bar.dart';
import 'package:flutter/material.dart';

import '../widget/count.dart';

class Short extends StatelessWidget {
  const Short({super.key});

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
            Flexible(flex: 1, child: Count()),
            Flexible(flex: 3, child: Shorts())
          ],
        ),
      ),
    );
  }
}
