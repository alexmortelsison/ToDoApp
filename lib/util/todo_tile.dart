import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  final void Function(bool?)? onChanged;
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
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(30),
              backgroundColor: Colors.red,
              onPressed: onDelete,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(30)),
          height: 120,
          child: Row(
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: isTaskCompleted,
                onChanged: onChanged,
                activeColor: const Color.fromARGB(255, 43, 136, 74),
              ),
              Text(
                taskName,
                style: TextStyle(
                    decoration:
                        isTaskCompleted ? TextDecoration.lineThrough : null),
              )
            ],
          ),
        ),
      ),
    );
  }
}
