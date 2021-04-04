import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mi_todo/screens/add_task_screen.dart';
import 'package:mi_todo/widgets/task_list.dart';
import 'package:mi_todo/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet<String>(
              isScrollControlled: true,
              context: context,
              builder: (context) => Container(
                // padding: EdgeInsets.only(
                //   bottom: MediaQuery.of(context).viewInsets.bottom,
                // ),
                child: AddTaskScreen(),
              ),
            );
          }),
      backgroundColor: Theme.of(context).accentColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 50,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'MiToDo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            TaskList(),
          ],
        ),
      ),
    );
  }
}
