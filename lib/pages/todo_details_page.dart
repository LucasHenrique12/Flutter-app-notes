import 'package:flutter/material.dart';
import 'package:to_do_list/model/todo_model.dart';

class TodoDetailsPage extends StatefulWidget {
  const TodoDetailsPage({Key? key}) : super(key: key);

  @override
  State<TodoDetailsPage> createState() => _TodoDetailsPageState();
}

class _TodoDetailsPageState extends State<TodoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TodoModel;
    return Scaffold(
        appBar: AppBar(
      title: Text(args.title),
    ));
  }
}
