import 'package:checklist/models/task_data_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {


  // const AddTaskScreen({Key? key}) : super(key: key);
  late String newTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 30.0,
                ),
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTask = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent)),
                onPressed: () {
                  // print(newTask);
                  Provider.of<TaskData>(context, listen: false).addTask(newTask);
                  Provider.of<TaskData>(context,listen: false).saveTasks(newTask);
                  Navigator.pop(context);
                  // tasksContainer.add(TaskTile(taskTitle:taskTitle));
                },
                child: const Text(
                  'ADD',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
