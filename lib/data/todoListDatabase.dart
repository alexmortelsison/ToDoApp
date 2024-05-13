import 'package:hive/hive.dart';

class TodoDatabase {
  final _myBox = Hive.box('myBox');

  List toDoList = [];

  void createInitialData() {
    toDoList = [
      ['Write some codes', false],
      ['Review code', false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  void updateDatabase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
