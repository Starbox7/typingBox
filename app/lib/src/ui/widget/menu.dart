import 'package:app/src/ui/widget/menu_button.dart';
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
            child: Text('자리 연습'),
          ),
        )),
        Flexible(
            child: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('낱말 연습'),
          ),
        )),
        Flexible(
            child: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('짧은 글 연습'),
          ),
        )),
        const Flexible(
            child: Center(
          child: MenuButton(
            menuName: '로그인',
            routeName: '/signin',
          ),
        )),
        Flexible(
            child: Center(
          child: ElevatedButton(
            onPressed: () => SystemNavigator.pop(),
            child: const Text('종료'),
          ),
        )),
      ],
    );
  }
}
