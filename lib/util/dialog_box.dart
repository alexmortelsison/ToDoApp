import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightBlue,
      content: Container(height: 120),
    );
  }
}
