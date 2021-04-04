import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mi_todo/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final int index;

  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Provider.of<TaskData>(context, listen: false).deleteTask(index);
      },
      child: CheckboxListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
