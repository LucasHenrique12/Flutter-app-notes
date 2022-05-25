import 'package:flutter/material.dart';
import 'package:to_do_list/pages/edit_todo_page.dart';
import 'package:to_do_list/pages/home_page.dart';
import 'package:to_do_list/pages/todo_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/details': (context) => const TodoDetailsPage(),
        '/edit': (context) => const EditTodoPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
