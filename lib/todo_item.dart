// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timesheet/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem(
      {Key? key, required this.todo, this.onToDoChanged, this.onDeleteItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.grey[350],));
    return Container(
     
      decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: ListTile(
          onTap: () {
            onToDoChanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.blue,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
                fontSize: 16,
                decoration: todo.isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.red),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () {
                //print('clicked on delete icon');
                onDeleteItem(todo.id);
              },
            ),
          ),
        ));
  }
}


/*Container(
padding: EdgeInsets.all(10),
   decoration: BoxDecoration(
                    border: Border.all(),color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 80,
               width: 360,
  child:Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
   Icon(Icons.check_box,color: Colors.blue,),
   Text('This is new test toto item',style: TextStyle(fontSize: 20),),
  Container(
    decoration: BoxDecoration(border: Border.all(),color: Colors.red),
    child: Icon(Icons.delete))

    
    
    
              ]  ),
  
   
            )*/