import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:checklist/models/task_data_provider.dart';

// ignore: use_key_in_widget_constructors
class TaskList extends StatelessWidget {
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
              deleteTaskCallback: (){
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
