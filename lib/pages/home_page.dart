import 'package:flutter/material.dart';
import 'package:todo_app/const.dart';

import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mycontroller = TextEditingController();

  List toDoList = [
    ['Write some code', false],
    ['Review code', false]
  ];

  void saveNewTask() {
    setState(() {
      toDoList.add([_mycontroller.text, false]);
    });
    Navigator.pop(context);
    _mycontroller.clear();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        onSave: saveNewTask,
        onCancel: () => Navigator.pop(context),
        controller: _mycontroller,
      ),
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(
            Icons.add,
          )),
      appBar: AppBar(
        title: const Text(
          'ToDo',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: toDoList[index][0],
          isCompleted: toDoList[index][1],
          onChanged: (value) => checkboxChanged(value, index),
          deleteFunction: (context) => deleteTask(index),
        ),
      ),
    );
  }
}
