import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  static String id = 'todo' ;
  ToDo({Key key}) : super(key: key);

  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("To-Do App"),
      ),
      backgroundColor: Colors.pink,
      body: Center(
        child: Text(
          "Coming Soon",
        ),
      )
    );
  }
}