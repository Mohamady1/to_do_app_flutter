import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(125),
          color: const Color.fromARGB(255, 224, 220, 220)),
    );
  }
}
