import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mi_todo/widgets/task_tile.dart';
import 'package:mi_todo/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Consumer<TaskData>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.taskCount,
            itemBuilder: (context, index) {
              final task = value.tasks[index];
              return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  value.updateTask(
                    task,
                  );
                },
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
