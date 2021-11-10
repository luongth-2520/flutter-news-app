import 'package:flutter/material.dart';

AppBar appBar(VoidCallback onPress) {
  return AppBar(
    elevation: 0.0,
    leading: IconButton(
      onPressed: onPress,
      icon: const Icon(Icons.arrow_back),
    ),
  );
}
