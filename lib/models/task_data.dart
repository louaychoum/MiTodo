import 'dart:collection';
import 'package:flutter/foundation.dart';

import 'package:mi_todo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Fruits'),
    Task(name: 'Drink Water'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  set addTask(String newTask) {
    _tasks.add(
      Task(
        name: newTask,
      ),
    );
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
