import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final String menuName;
  final String routeName;
  final int arguments;

  const LevelButton({
    super.key,
    required this.menuName,
    required this.routeName,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(menuName),
      onPressed: () => Navigator.pushNamed(
        context,
        routeName,
        arguments: arguments,
      ),
    );
  }
}
