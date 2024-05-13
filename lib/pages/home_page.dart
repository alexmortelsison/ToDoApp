import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/const.dart';
import 'package:todo_app/data/todoDatabase.dart';

import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  final _mycontroller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_mycontroller.text, false]);
      _mycontroller.clear();
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
        controller: _mycontroller,
      ),
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: db.toDoList[index][0],
          isCompleted: db.toDoList[index][1],
          onChanged: (value) => checkboxChanged(value, index),
          deleteFunction: (context) => deleteTask(index),
        ),
      ),
    );
  }
}
