import 'package:flutter/material.dart';

import 'package:to_do_app/widgets/homeScreenWidget/home_page.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15),
      width: double.infinity,
      height: double.infinity,
      child: const HomePage(),
    ));
  }
}
