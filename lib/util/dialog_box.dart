import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.lightBlue,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(),
          ],
        ),
      ),
    );
  }
}
