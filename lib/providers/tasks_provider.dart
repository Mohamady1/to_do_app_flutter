import 'package:flutter/material.dart';

import 'package:to_do_app/helpers/db_helper.dart';

class TasksProvider with ChangeNotifier {
  void addTasks(String task) async {
    await DBHelper()
        .insertData("INSERT INTO tasks VALUES (null, '$task', 'false')");
    notifyListeners();
  }

  void removeTasks(int id) {
    DBHelper().deleteData("DELETE FROM tasks WHERE id = '$id'");
    notifyListeners();
  }

  void toggleComplete(int id, String complete) {
    DBHelper()
        .updateData("UPDATE tasks SET complete = '$complete' WHERE id = $id");
    notifyListeners();
  }
}
