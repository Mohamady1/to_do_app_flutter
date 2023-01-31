import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:to_do_app/providers/tasks_provider.dart';

import 'package:to_do_app/helpers/db_helper.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  Future<List<Map>> getTasks() async {
    List<Map> allData = await DBHelper().readData("SELECT * FROM tasks");
    return allData;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
        child: FutureBuilder(
            future: getTasks(),
            builder: (context, snapshot) => snapshot.hasData
                ? snapshot.data!.isEmpty
                    ? const Center(
                        child: FittedBox(
                          child: Text(
                            "Make Your Day Productive",
                            style: TextStyle(
                              fontSize: 30,
                              shadows: [
                                Shadow(
                                  color: Color.fromARGB(255, 192, 107, 10),
                                  blurRadius: 6.0,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: ((context, index) {
                          return snapshot.connectionState ==
                                  ConnectionState.done
                              ? Dismissible(
                                  key: ValueKey(snapshot.data![index]['id']),
                                  background: Container(
                                    color:
                                        const Color.fromARGB(255, 209, 31, 19),
                                    alignment: Alignment.centerRight,
                                    child: const Icon(Icons.delete,
                                        color: Colors.white, size: 40),
                                  ),
                                  onDismissed: (context) {
                                    setState(() {
                                      snapshot.data!.length - 1;
                                      provider.removeTasks(
                                          snapshot.data![index]['id']);
                                    });
                                  },
                                  direction: DismissDirection.endToStart,
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          224,
                                          220,
                                          220,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                              snapshot.data![index]['task'],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  decoration: snapshot
                                                                  .data![index]
                                                              ["complete"] ==
                                                          "true"
                                                      ? TextDecoration
                                                          .lineThrough
                                                      : null)),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            provider.toggleComplete(
                                                snapshot.data![index]["id"],
                                                snapshot.data![index]
                                                            ["complete"] ==
                                                        "true"
                                                    ? "false"
                                                    : "true");
                                          },
                                          icon: snapshot.data![index]
                                                      ['complete'] ==
                                                  "true"
                                              ? const Icon(Icons.circle)
                                              : const Icon(
                                                  Icons.circle_outlined),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : null;
                        }),
                        itemCount: snapshot.data!.length)
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )));
  }
}
