import 'package:flutter/material.dart';
import 'package:todo_app/todo_list.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: TodoList(),
    );
  }
}

