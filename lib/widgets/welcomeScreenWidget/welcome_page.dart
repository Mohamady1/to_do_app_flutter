import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void goToTasks() {
      Navigator.of(context).pushReplacementNamed("/tasks");
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/images/intropic.jpg",
          width: double.infinity,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15),
          child: Text(
              "Welcome to an efficient way to manage your tasks and stay on top of your to-do list!",
              style: TextStyle(fontSize: 24)),
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: goToTasks,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Unlock My Productivity",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
            ))
      ],
    );
  }
}
