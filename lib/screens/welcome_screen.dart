import 'package:flutter/material.dart';

import 'package:to_do_app/widgets/welcomeScreenWidget/circle.dart';
import 'package:to_do_app/widgets/welcomeScreenWidget/welcome_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.loose,
      children: [
        Positioned(
            bottom: 10,
            left: (MediaQuery.of(context).size.width / -4),
            child: const Circle()),
        Positioned(
            top: (MediaQuery.of(context).size.height / 4) + 150,
            right: (MediaQuery.of(context).size.width / -4),
            child: const Circle()),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: const WelcomePage(),
        )
      ],
    ));
  }
}
