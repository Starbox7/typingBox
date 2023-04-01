import 'package:app/src/ui/widget/challenge.dart';
import 'package:app/src/ui/widget/menu.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/screen_padding.dart';
import 'package:app/src/utils/title_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(),
      body: Container(
        padding: screenPadding(),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Flexible(
                flex: 1,
                child: Menu(),
              ),
              Flexible(
                flex: 3,
                child: Challenge(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
