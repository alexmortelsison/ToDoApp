import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/const.dart';

import 'pages/home_page.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color.fromARGB(255, 56, 115, 117),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: kPrimaryColor)),
      home: const HomePage(),
    );
  }
}
