import 'package:flutter/material.dart';

SnackBar failSnackbar(String msg) => SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.cancel_outlined,
            color: Colors.white,
          ),
          const SizedBox(width: 20),
          Text(msg),
        ],
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
    );

SnackBar successSnackbar(String msg) => SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.check_circle_outline_outlined,
            color: Colors.white,
          ),
          const SizedBox(width: 20),
          Text(msg),
        ],
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blueAccent,
    );
