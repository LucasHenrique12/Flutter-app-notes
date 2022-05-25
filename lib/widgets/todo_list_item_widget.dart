import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../model/todo_model.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem(
      {Key? key,
      required this.item,
      required this.onDeleteTodo,
      required this.onUpdateTodo})
      : super(key: key);
  final TodoModel item;
  final Function(TodoModel) onDeleteTodo;
  final Function(TodoModel) onUpdateTodo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/details', arguments: item),
      child: Slidable(
        key: UniqueKey(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          padding:
              const EdgeInsets.only(right: 100, top: 17, bottom: 17, left: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              DateFormat('dd/MM/yyyy').format(item.date),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFE4A49),
              ),
            ),
          ]),
        ),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          extentRatio: 0.25,
          dismissible: DismissiblePane(
            onDismissed: () => onDeleteTodo(item),
          ),
          children: [
            SlidableAction(
              onPressed: (_) => onUpdateTodo(item),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Editar',
            ),
          ],
        ),
      ),
    );
  }

  buildlist(param0) {}
}

void doNothing(BuildContext context) {}
