import 'package:flutter/material.dart';
import 'package:to_do_list/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem({Key? key,required this.todo,required this.onToDoChanged,required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:15,),
      child: ListTile(
        onTap: (){
          print('tıklandı');
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5,
        ),
        tileColor: Colors.white,
        leading:Icon(todo.isDone?
          Icons.check_box:Icons.check_box_outline_blank,color: Colors.blueAccent,) ,
        title: Text(todo.todoText!,
          style:TextStyle(
          fontSize: 16,
            color: Colors.black45,
        decoration: todo.isDone? TextDecoration.lineThrough:null,),
        ),
       trailing:Container(
         padding: EdgeInsets.all(0),
         margin: EdgeInsets.symmetric(vertical: 12),
         height: 30,
         width: 30,
         decoration: BoxDecoration(
           color: Colors.deepPurpleAccent,
           borderRadius: BorderRadius.circular(7),
         ),
         child: IconButton(
           color: Colors.white,
           iconSize: 15,
           icon: Icon(Icons.delete
           ),
           onPressed: (){

             onDeleteItem(todo.id);

           },
         ),
       ) ,
      ),
    );
  }
}
