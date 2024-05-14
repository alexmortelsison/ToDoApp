import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/const.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kPrimaryColor,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Add a new task'),
              controller: controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: 'Save',
                  onPressed: onSave,
                ),
                const SizedBox(width: 8),
                MyButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
