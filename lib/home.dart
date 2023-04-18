// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timesheet/todo.dart';
import 'package:timesheet/todo_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[350],
    ));
    return MaterialApp(
      title: 'All Todos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF25D366),
      ),
      home: Scaffold(
         // backgroundColor: Colors.grey[350],
          appBar: AppBar(
              backgroundColor: Colors.grey[350],
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 30,
                  ),
                  Container(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'images/varun.jpeg',
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ))
                ],
              )),
          body: Column(
            children: [
              Expanded(
                  child: ListView(shrinkWrap: true, children: [
                Container(
                  color: Colors.grey[350],
                  child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          // border: Border.all(),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      height: 50,
                      width: 340,
                      child: Row(children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.search),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: SizedBox(
                              width: 160,
                              child: TextField(
                                onChanged: (value) => _runFlutter(value),
                                decoration: InputDecoration(
                                    hintText: 'Search',
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                              )),
                        ),
                      ])),
                ),
                Container(
                    color: Colors.grey[350],
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "All ToDo's",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 30),
                                  ))
                            ]), // SizedBox(height: 20,),
                        for (ToDo todoo in _foundToDo.reversed)
                          ToDoItem(
                            todo: todoo,
                            onToDoChanged: _handleToDoChange,
                            onDeleteItem: _deleteToDoItem,
                          ),
                      ],
                    ))
              ])),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      color: Colors.grey[350],
                      child: Row(children: [
                        Container(
                          color: Colors.grey[350],
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            padding: EdgeInsets.only(left: 50, bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            height: 50,
                            width: 280,
                            child: SizedBox(
                                width: 150,
                                child: TextField(
                                  controller: _todoController,
                                  decoration: InputDecoration(
                                    hintText: 'Add a new todo button',
                                  ),
                                )),
                          ),
                        ),
                        Container(
                            color: Colors.grey[350],
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(), color: Colors.blue),
                              height: 50,
                              width: 50,
                              child: ElevatedButton(
                                child:
                                    Text('+', style: TextStyle(fontSize: 40)),
                                onPressed: () {
                                  _addToDoItem(_todoController.text);
                                },
                              ),
                            )),
                      ])))
            ],
          )),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFlutter(String enterKeyword) {
    List<ToDo> results = [];
    if (enterKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) =>
              item.todoText!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }
}
/*  Container(
padding: EdgeInsets.all(10),
   decoration: BoxDecoration(
                    border: Border.all(),color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 80,
               width: 360,
  child:Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
   Icon(Icons.check_box_outline_blank,),
   Text('This is new test todto item',style: TextStyle(fontSize: 20),),
  Container(
    decoration: BoxDecoration(border: Border.all(),color: Colors.red),
    child: Icon(Icons.delete))

    
    
    
              ]  ),
  
   
            )*/ 