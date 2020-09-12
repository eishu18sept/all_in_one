import 'package:flutter/material.dart';
import 'package:all_in_one/todo_app/widgets/task_tile.dart';
import 'package:all_in_one/todo_app/models/tasks.dart';

class TaskList extends StatefulWidget {

  final List<Task> tasks ;
  TaskList(this.tasks);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

    @override
    Widget build(BuildContext context) {
      return ListView.builder(itemBuilder: (context,index){
        return TaskTile(
          taskTitle: widget.tasks[index].name ,
          isChecked: widget.tasks[index].isDone ,
          checkboxCallback : (bool checkBoxState) {
            setState(() {
              widget.tasks[index].toggleDone(); 
            });
          },
          longPressCallback: (){},
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}


// (
//         children: [
//           TaskTile(taskTitle: tasks[0].name , isChecked: tasks[0].isDone ),
//           TaskTile(taskTitle: tasks[1].name , isChecked: tasks[1].isDone ),
//           TaskTile(taskTitle: tasks[2].name , isChecked: tasks[2].isDone ),
//         ],
//       );