import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String menuName;
  final String routeName;

  const MenuButton({
    super.key,
    required this.menuName,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(menuName),
      onPressed: () => Navigator.pushNamed(context, routeName),
    );
  }
}
