import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/const.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  const ToDoTile({
    super.key,
    required this.onChanged,
    required this.taskName,
    required this.isTaskCompleted,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            backgroundColor: Colors.red,
            icon: Icons.delete,
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: kBoxDecoration,
          child: Row(
            children: [
              Checkbox(
                value: isTaskCompleted,
                onChanged: onChanged,
                activeColor: kPrimaryColor,
                shape: const CircleBorder(),
              ),
              Text(taskName,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      decoration:
                          isTaskCompleted ? TextDecoration.lineThrough : null)),
            ],
          ),
        ),
      ),
    );
  }
}
