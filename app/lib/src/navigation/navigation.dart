import 'package:app/src/ui/screens/Home.dart';
import 'package:app/src/ui/screens/signin.dart';
import 'package:app/src/ui/screens/signup.dart';
import 'package:app/src/utils/title_bar.dart';
import 'package:flutter/material.dart';

import '../ui/screens/position.dart';
import '../ui/screens/word.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? child) => MediaQuery(
        //텍스트 크기를 1로 고정한다.
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
      title: "typingBox",
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/signin': (context) => const Signin(),
        '/signup': (context) => const Signup(),
        '/setting': (context) => Scaffold(
              appBar: titleBar(),
              body: const Placeholder(),
            ),
        '/position': (context) => const Position(),
        '/word': (context) => const Word(),
      },
    );
  }
}

//stateless 시작해서 statefull이 되지 않아도 문제가 없으면 less를 사용하는것이 무조건 좋음.
  //component will be down