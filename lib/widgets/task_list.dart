import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:checklist/models/task_data_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: use_key_in_widget_constructors

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

   void readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? allTaskLists;
     allTaskLists= prefs.getStringList('allTasks');
    if (allTaskLists!.isNotEmpty) {
      for (int i = 0; i < allTaskLists.length; i++) {
        print(allTaskLists[i]);
        Provider.of<TaskData>(context, listen: false).allTaskList.add(allTaskLists[i]);
        Provider.of<TaskData>(context,listen: false).addTask(allTaskLists[i]);
      }
    }
  }
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData(); 
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].taskName,
              checked: taskData.tasks[index].isDone,
              checkboxCallback: (bool? value) {
                taskData.updateTask(taskData.tasks[index]);
              },
              deleteTaskCallback: () {
                taskData.deleteTask(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
