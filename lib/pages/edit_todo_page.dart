import 'package:flutter/material.dart';
import '../model/todo_model.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({Key? key}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TodoModel;
    if (titleController.text.isEmpty) {
      titleController.text = args.title;
    }
    if (linkController.text.isEmpty) {
      linkController.text = args.link ?? '';
    }
    if (desController.text.isEmpty) {
      desController.text = args.description ?? '';
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
        onPressed: () {
          final updatedTodo = args.copyWith(
              title: titleController.text,
              link: linkController.text,
              description: desController.text);
          Navigator.pop(context, updatedTodo);
        },
      ),
      appBar: AppBar(
        title: Text('Editar ${args.title}'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: TextField(
            controller: titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'titulo',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TextField(
            controller: linkController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Link',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TextField(
            controller: desController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Descrição',
            ),
          ),
        ),
      ]),
    );
  }
}
