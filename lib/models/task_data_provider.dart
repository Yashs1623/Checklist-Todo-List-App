import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:checklist/models/tasks.dart';

class TaskData extends ChangeNotifier{
  final List<Task> _tasks = [];
  final List<String>allTaskList=[];
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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  void deleteTask(index)async{
    _tasks.removeAt(index);
    print(allTaskList.length);
    allTaskList.removeAt(index);
    final SharedPreferences prefs = await _prefs;
    await prefs.setStringList('allTasks',allTaskList);
    notifyListeners();
  }

  
  void saveTasks(String taskName)async{
    final SharedPreferences prefs = await _prefs;
    allTaskList.add(taskName);
    await prefs.setStringList('allTasks',allTaskList);
  }

}