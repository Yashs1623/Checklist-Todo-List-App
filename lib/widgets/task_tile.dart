import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TaskTile extends StatelessWidget {
  final bool checked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final Function() deleteTaskCallback;
  TaskTile(
      {required this.checked,
      required this.taskTitle,
      required this.checkboxCallback,
      required this.deleteTaskCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteTaskCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: checked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: checked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
