import 'package:app/src/ui/widget/menu_button.dart';
import 'package:app/src/utils/screen_padding.dart';
import 'package:app/src/utils/title_bar.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formaKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(),
      body: Container(
        padding: screenPadding(),
        child: Form(
            key: _formaKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Flexible(
                  flex: 1,
                  child: Text(
                    'Sign In',
                    textScaleFactor: 3.0,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        controller: _idController,
                      ),
                      TextFormField(
                        controller: _passwordController,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sign In'),
                      ),
                      const MenuButton(
                        menuName: 'Sign Up',
                        routeName: '/signup',
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

//full과 less의 결정적 차이 : 위젯이 실시간으로 업데이트 하는가? => full 위젯