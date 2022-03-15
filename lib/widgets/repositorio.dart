import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../modules/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({ Key? key,required this.item}) : super(key: key);
final Todo item;
  @override
  Widget build(BuildContext context) {
    return Slidable(  
      key: const ValueKey(0),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      padding:const EdgeInsets.only(right: 300,top:17,bottom: 17,left:10),
      
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Text(
          DateFormat('dd/MM/yyyy').format(item.date),
          style:const TextStyle(
          fontSize: 12,
        ),),
        Text(
          item.title,
        style:const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),),
      ]),
    ),
    
    endActionPane:ActionPane(
      
      motion: const StretchMotion(), 
      extentRatio: .2,
   dismissible: DismissiblePane(onDismissed: () {}),
      children:const [
        SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
        ),
        
        ],
      ),
     
   );
  
  }
}

void doNothing(BuildContext context) {}