// ignore: file_names
import 'package:flutter/material.dart';
import '../model/todo_model.dart';
import '../widgets/todo_list_item_widget.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<TodoModel> todos = [];

  final TextEditingController todoController = TextEditingController();
  TodoModel? deletedTodo;
  int? deletedTodoPos;
  @override
  // ignore: dead_code

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: TextField(
                        controller: todoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Adicione uma tarefa',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          String text = todoController.text;
                          setState(() {
                            TodoModel newItem = TodoModel(
                              title: text,
                              date: DateTime.now(),
                            );
                            todos.add(newItem);
                          });
                          todoController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff00d7f3),
                          padding: const EdgeInsets.all(14),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        ))
                  ],
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return TodoListItem(
                          item: todos[index],
                          onDeleteTodo: onDeleteTodo,
                          onUpdateTodo: onUpdateTodo,
                        );
                      },
                      shrinkWrap: true,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Você possui ${todos.length} tarefas pendentes',
                    )),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: (() => deleteAllTodos()),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff00d7f3),
                        padding: const EdgeInsets.all(14),
                      ),
                      child: const Text('Limpar tudo'),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }

  void onDeleteTodo(TodoModel todo) {
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${todo.title} foi removido!',
          style: const TextStyle(color: Color(0xff060700)),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: const Color(0xff00d7f3),
          onPressed: () {
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
          },
        ),
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
  }

  void onUpdateTodo(TodoModel todo) async {
    final result = await Navigator.pushNamed(context, '/edit', arguments: todo)
        as TodoModel?;
    setState(() {
      if (result != null) {
        for (var item in todos) {
          if (item.title == todo.title) {
            todos[todos.indexOf(item)] = result;
          }
        }
      }
    });
  }
}
