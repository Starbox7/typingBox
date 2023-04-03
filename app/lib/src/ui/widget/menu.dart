import 'package:app/src/navigation/navigation.dart';
import 'package:app/src/ui/widget/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/snack_bar.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authBloc.userStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
            checkMember(context),
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
      },
    );
  }

  Widget checkMember(BuildContext context) {
    if (!authBloc.user) {
      return const Flexible(
        child: Center(
          child: MenuButton(
            menuName: '로그인',
            routeName: '/signin',
          ),
        ),
      );
    }
    return Flexible(
      flex: 2,
      child: Column(
        children: [
          const Flexible(
            child: Center(
              // menuButton
              // go setting screen
              child: MenuButton(menuName: '설정', routeName: 'setting'),
            ),
          ),
          Flexible(
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  // auth bloc - signout
                  await authBloc.signout();
                  // if auth bloc user == false
                  // snackbar - failure
                  // return
                  // snackbar - true
                  // navigation pusu name remove until same signin
                  if (authBloc.user) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(failSnackbar('Sign Out Fail'));
                    return;
                  }
                  ScaffoldMessenger.of(context)
                      .showSnackBar(successSnackbar('Sign Out Success'));
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', ((route) => false));
                },
                child: const Text('로그아웃'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
