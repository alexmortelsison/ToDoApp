import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/const.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onDelete;
  const ToDoTile({
    super.key,
    required this.taskName,
    required this.isTaskCompleted,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(30),
              backgroundColor: Colors.red,
              icon: Icons.delete,
              onPressed: onDelete,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 120,
          child: Row(
            children: [
              Checkbox(
                shape: const CircleBorder(),
                activeColor: kPrimaryColor,
                value: isTaskCompleted,
                onChanged: onChanged,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration:
                      isTaskCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
