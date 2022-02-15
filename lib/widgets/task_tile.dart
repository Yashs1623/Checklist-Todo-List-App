import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TaskTile extends StatefulWidget {

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text('This is a task',
      style: TextStyle(
        decoration: checked? TextDecoration.lineThrough:null,
      ),),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: checked,
        onChanged: (bool? value) {
          setState(() {
            checked = value!;
            // print(checked);
          });
        },
      ),
    );
  }
}
