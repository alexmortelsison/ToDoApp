import 'package:flutter/material.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('ToDo'),
      ),
      body: ListView(
        children: [
          ToDoTile(
            taskName: 'Write some code',
            taskCompleted: true,
            onChanged: (p0) {},
          ),
          ToDoTile(
            taskName: 'Do Exercise',
            taskCompleted: false,
            onChanged: (p0) {},
          ),
        ],
      ),
    );
  }
}
