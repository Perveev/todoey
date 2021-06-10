import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constans/palette.dart';
import 'package:todoey/constans/styles.dart';
import 'package:todoey/models/new_task.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final newTask = NewTask();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.buttomSheetBackground,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyles.BottomSheetlabel,
              ),
              TextField(
                onChanged: (newValue) => newTask.name = newValue,
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: TextButton(
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false).addTask(newTask.name);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
