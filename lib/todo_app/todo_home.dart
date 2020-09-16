import 'package:all_in_one/todo_app/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:all_in_one/todo_app/widgets/task_list.dart';
import 'package:all_in_one/todo_app/models/tasks.dart';

  List<Task> tasks = [];

  class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("ToDo App"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),
        ), 
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[200],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[200],
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
            context: context, 
            builder: (context) => 
            AddTaskScreen((newTask){
              setState(() {
                tasks.add(Task(name: newTask));
              });
              Navigator.pop(context);
            }),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                      ),
                      backgroundColor: Colors.white,
                      radius: 30.0,
                    ),
                    Text(
                      "  ${tasks.length} Tasks Left",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                ),
                child: TaskList(tasks),
              ),
            ),
        ],
      ),
    );
  }
}