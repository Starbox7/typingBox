import 'package:app/src/bloc/auth/auth_bloc.dart';
import 'package:app/src/data/repository/auth_repository.dart';
import 'package:app/src/utils/title_bar.dart';
import 'package:app/src/utils/screen_padding.dart';
import 'package:app/src/utils/snack_bar.dart';
import 'package:app/src/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
    AuthRepository authRepository = AuthRepository();
    AuthViewModel authViewModel = AuthViewModel(
      authBloc: BlocProvider.of<AuthBloc>(context),
      authRepository: authRepository,
    );
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
                    'Sign Up',
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your ID';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Password';
                          }
                          return null;
                        },
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
                        onPressed: () async {
                          if (_formaKey.currentState!.validate()) {
                            String id = _idController.text;
                            String password = _passwordController.text;
                            bool result =
                                await authViewModel.signup(id, password);
                            if (result) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  successSnackbar('Sign Up Success'));
                              Navigator.pop(context);
                              return;
                            }
                            ScaffoldMessenger.of(context)
                                .showSnackBar(failSnackbar('Sign Up Fail'));
                          }
                        },
                        child: const Text('Sign Up'),
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