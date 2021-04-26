import 'package:assignment3/db_helper.dart';
import 'package:assignment3/task_model.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class TaskWidget extends StatefulWidget {
  Task task;
  Function function;
  TaskWidget(this.task, [this.function]);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  try {
                    DBHelper.dbHelper
                        .deleteTask(tasksList.removeAt(tasksList.length));
                  } on Exception catch (e) {
                    print(e);
                  }
                }),
            Text(widget.task.taskName),
            Checkbox(
                value: widget.task.isComplete,
                onChanged: (value) {
                  this.widget.task.isComplete = !this.widget.task.isComplete;
                  setState(() {});
                  widget.function();
                })
          ],
        ),
      ),
    );
  }
}
