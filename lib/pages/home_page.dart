import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/const.dart';
import 'package:todo_app/data/database.dart';

import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('myBox');
  final TextEditingController _controller = TextEditingController();
  final ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    _mybox.get('TODOLIST') == null ? db.createInitialState() : db.loadData();
    super.initState();
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.pop(context);
    db.updateData();
  }

  void createNewTask() => showDialog(
      context: context,
      builder: (context) => DialogBox(
            onSave: saveNewTask,
            onCancel: () => Navigator.pop(context),
            controller: _controller,
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
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
