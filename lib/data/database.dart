import 'package:hive/hive.dart';

class ToDoDatabase {
  final _myBox = Hive.box('myBox');

  List toDoList = [];

  void createInitialState() {
    toDoList = [
      ['Write some codes', false],
      ['Review code', false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  void updateData() {
    _myBox.put('TODOLIST', toDoList);
  }
}
