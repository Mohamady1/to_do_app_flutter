import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:to_do_app/providers/tasks_provider.dart';

import 'package:to_do_app/screens/tasks_screen.dart';
import 'package:to_do_app/screens/welcome_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TasksProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Inder"),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      routes: {"/tasks": (context) => const TasksScreen()},
    );
  }
}
