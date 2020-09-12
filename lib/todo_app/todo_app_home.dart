import 'package:flutter/material.dart';
import 'package:all_in_one/todo_app/todo_home.dart';

class ToDo extends StatefulWidget {
  static String id = 'todo' ;
  ToDo({Key key}) : super(key: key);

  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(),
    );
  }
}