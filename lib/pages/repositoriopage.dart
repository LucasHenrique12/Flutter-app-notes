import 'package:flutter/material.dart';

import '../modules/todo.dart';
import '../widgets/repositorio.dart';

// ignore: must_be_immutable
class RepositorioPage extends StatefulWidget {
    const RepositorioPage({ Key? key }) : super(key: key);

  @override
  State<RepositorioPage> createState() => RepositorioPageState();
}

class RepositorioPageState extends State<RepositorioPage> {
  List <Todo> todos=[];

  final TextEditingController todoController = TextEditingController();

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: Center(
         child: Padding(
           padding: const EdgeInsets.all(16), 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
           children:[
               Expanded(
               flex: 6,
               child: TextField(
                      controller: todoController,
                      decoration:const InputDecoration(
               border: OutlineInputBorder(),
                       hintText:'Adicione uma tarefa',
             
                      ),
                    ),
             ),
             const SizedBox(width: 8,),
            ElevatedButton(onPressed: (){
              String text= todoController.text;
              setState(() {
                Todo newItem=Todo(
                  title: text,
                  date: DateTime.now(),
          
                );
                todos.add(newItem);
              });
              todoController.clear();
              
            } ,
            style: ElevatedButton.styleFrom(
              primary:const Color(0xff00d7f3),
              padding: const EdgeInsets.all(14),
            ),
            child:const Icon(
              Icons.add,
              size: 30,
            )
            )
             ],),
              const SizedBox(height:16),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                children: [ 
                  for(Todo todo in todos)
                    TodoListItem(
                     item: todo,
                   ),
                
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children:  [
                  Expanded(child: Text(
                    'Você possui ${todos.length} tarefas pendentes',
                  
                  )
                  ),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: (){},
                style:ElevatedButton.styleFrom(
                  primary: const Color(0xff00d7f3),
                  padding: const EdgeInsets.all(14),
                ),
                 child:const Text('Limpar tudo'),),
                 
                ],
             )
            ],
          
          )
            ),
         
          
           ),
          ),
    );

  }
}

