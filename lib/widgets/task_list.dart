import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final Task task = taskData.tasks[index];
            return TaskTile(
              name: task.name,
              isChecked: task.isDone,
              toggleCheckboxState: () => taskData.updateTask(task),
              removeTask: () => taskData.removeTask(index),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
