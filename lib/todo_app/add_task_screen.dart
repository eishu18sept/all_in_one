import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallBack ;
  AddTaskScreen(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    
    String newTask ;

    return Container(
      height: MediaQuery.of(context).size.width ,
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5.0),
                child: TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newText){
                    newTask = newText ;
                  },
                ),
              ),
              FlatButton(
                color: Colors.green[200],
                onPressed: (){
                  addTaskCallBack (newTask);
                }, 
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}