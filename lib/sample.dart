// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timesheet/todo.dart';
import 'package:timesheet/todo_item.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white70));
    return MaterialApp(
      title: 'All Todos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF25D366),
      ),
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white70,
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
          body:Align(alignment: Alignment.bottomCenter,
          child: Row(children: [
Text('cns',
),


          ],)
          ,),
    ));
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