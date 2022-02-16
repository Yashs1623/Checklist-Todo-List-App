import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:checklist/models/tasks.dart';

class TaskData extends ChangeNotifier{
  final List<Task> _tasks = [];
  int get taskCount{
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  void addTask(newTaskName){
    final newTask = Task(taskName: newTaskName);
    _tasks.add(newTask);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(index){
    _tasks.removeAt(index);
    notifyListeners();
  }

}