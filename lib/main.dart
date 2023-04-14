import 'package:flutter/material.dart';
import 'package:to_do_list/todo_item.dart';
import 'package:to_do_list/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yapılacaklar Listesi',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Yapılacaklar Listesi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todosList=ToDo.todoList();
  List<ToDo> _foundToDo=[];
  final _todoController= TextEditingController();

  @override
  void initState() {
   _foundToDo=todosList;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,

        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: Column(
              children: [
           Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(20)
            ) ,
            child: TextField(
              onChanged: (value)=>_runFilter(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color:Colors.deepOrangeAccent ,
                ),
                prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,
                    minWidth: 25
                ),
                border: InputBorder.none,
                hintText:'Ara',
              ),
            ),
          ),
                Expanded(child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 25,bottom: 25,
                      ),
                      child: Text(
                          'Yapılacaklar',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400
                      ),
                      ),
                    ),
                    for( ToDo todoo in _foundToDo)
                    ToDoItem(todo:todoo ,
                    onToDoChanged: _handleToDoChange,
                      onDeleteItem: _deleteToDoItem,
                    ),
                  ],

                ),)

              ],
            ),
          ),
         Align(
           alignment:Alignment.bottomCenter ,
           child:Row(
             children: [
               Expanded(child: Container(
              margin: EdgeInsets.only(bottom: 20,right:20,left: 20,
              ),
                 padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10,) ,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   boxShadow: const[
                     BoxShadow(
                       color: Colors.purpleAccent,
                       offset: Offset(0.0, 0.0),
                       blurRadius: 20.0,
                       spreadRadius: 0.0,
                     ),
                   ],

                 ),
                 child: TextField(
                   controller:_todoController ,
                   decoration: InputDecoration(
                     hintText: 'YENİ HEDEF EKLEYİNİZ',
                     border: InputBorder.none,
                   ),
                 ),
               ),
               ),
               Container(
                 margin: EdgeInsets.only(
                   bottom: 20,right: 20,
                 ),
                 child:ElevatedButton(
                     child: Text('+',style:TextStyle(
                       fontSize: 40,
                     ),
                     ),
                   onPressed: (){

                       _addToDoItem(_todoController.text);
                   },
                   style: ElevatedButton.styleFrom(
                     primary: Colors.purpleAccent,
                     minimumSize: Size(60, 60),
                     elevation: 10,
                   ),
                 ) ,
               ),
             ],
           ) ,
         ),
        ],
      ),
    );
  }


  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
    void _deleteToDoItem(String id) {
      setState(() {
        todosList.removeWhere((item) => item.id == id);
      });

}

void _addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
_todoController.clear(); //yeni bir şey ekleyince siler
}

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) =>
          item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo=results;
    });
  }

}
