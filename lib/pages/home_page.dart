import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/todoListDatabase.dart';
import 'package:todo_app/util/todo_tile.dart';

import '../util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  final _controller = TextEditingController();
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.pop(context);
    db.updateDatabase();
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
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
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
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) => ToDoTile(
                taskName: db.toDoList[index][0],
                isTaskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkboxChanged(value, index),
                onDelete: (context) => deleteTask(index),
              )),
    );
  }
}
