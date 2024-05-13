import 'package:flutter/material.dart';
import 'package:todo_app/util/todo_tile.dart';

import '../util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ['Write some codes', false],
    ['Review code', false],
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });

    Navigator.pop(context);
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        onSave: saveNewTask,
        onCancel: () => Navigator.pop(context),
        controller: _controller,
      ),
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'ToDo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) => ToDoTile(
                taskName: toDoList[index][0],
                isTaskCompleted: toDoList[index][1],
                onChanged: (value) => checkboxChanged(value, index),
                onDelete: (context) => deleteTask(index),
              )),
    );
  }
}
