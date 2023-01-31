import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:to_do_app/providers/tasks_provider.dart';

import 'package:to_do_app/widgets/homeScreenWidget/tasks_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _task = TextEditingController();

  @override
  void dispose() {
    _task.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TasksProvider>(context);

    addTask() async {
      if (_task.text.isEmpty) {
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Type Something to add",
          textAlign: TextAlign.center,
        )));
      }
      tasks.addTasks(_task.text);
      _task.clear();
    }

    String getTimeOfDay() {
      final now = DateTime.now();
      final hour = now.hour;
      if (hour < 6) {
        return 'Night';
      } else if (hour < 18) {
        return 'Day';
      } else {
        return 'Night';
      }
    }

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getTimeOfDay() == "Day"
                ? const Icon(Icons.sunny, size: 50, color: Colors.yellow)
                : const Icon(Icons.nightlight_outlined, size: 50),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Greetings !",
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
            "Conqure your to-do list and watch your productivity soar. 💪",
            style: TextStyle(fontSize: 24)),
        const TasksList(),
        Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: TextField(
                      controller: _task,
                      decoration: InputDecoration(
                          labelText: "Hit it now ... ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ))),
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                      onSubmitted: (_) {
                        addTask();
                      }),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () => {addTask()},
                  icon: const Icon(Icons.add_circle, size: 45),
                )
              ],
            ))
      ]),
    );
  }
}
