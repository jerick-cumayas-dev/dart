import 'package:flutter/material.dart';

SnackBar successSnackBar(BuildContext context, String message) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.green,
    duration: const Duration(seconds: 3),
  );
}

SnackBar errorSnackBar(BuildContext context, String message) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 3),
  );
}