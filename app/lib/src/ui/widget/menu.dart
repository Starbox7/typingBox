import 'package:app/src/ui/widget/member_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('자리 연습'),
            ),
          ),
        ),
        Flexible(
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('낱말 연습'),
            ),
          ),
        ),
        Flexible(
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('짧은 글 연습'),
            ),
          ),
        ),
        const MemberMenu(),
        Flexible(
          child: Center(
            child: ElevatedButton(
              onPressed: () => SystemNavigator.pop(),
              child: const Text('종료'),
            ),
          ),
        ),
      ],
    );
  }
}
