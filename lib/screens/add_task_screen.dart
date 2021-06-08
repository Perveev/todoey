import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constans/colors.dart';
import 'package:todoey/constans/styles.dart';
import 'package:todoey/models/task_data.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColors.buttomSheetBackground,
      child: Container(
        decoration: const BoxDecoration(
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
                onChanged: (newValue) => name = newValue,
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: TextButton(
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false).addTask(name);
                      Navigator.pop(context);
                    },
                    child:const Text(
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
