import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  final Function(bool?)? onChanged;
  const ToDoTile({
    super.key,
    required this.onChanged,
    required this.taskName,
    required this.isTaskCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Checkbox(
              value: isTaskCompleted,
              onChanged: onChanged,
              activeColor: Colors.blue,
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
    );
  }
}
