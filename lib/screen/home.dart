import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myfirstapp/controller/getcontroller.dart';

class Todo {
  String title;
  bool isCompleted;

  Todo({required this.title, this.isCompleted = false});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller todoController = Get.put(controller());
  TextEditingController con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 2, 86, 135),
          title: const Text('Todo App Demo using GetX')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: todoController.todos.length,
                  itemBuilder: (context, index) {
                    var todo = todoController.todos[index];
                    return ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(fontSize: 19),
                      ),
                      // leading: Checkbox(
                      //   value: todo.isCompleted,
                      //   onChanged: (_) {
                      //     todoController.toggleTodoStatus(index);
                      //   },
                      // ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          todoController.removeTodo(index);
                        },
                      ),
                    );
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: con,
                    decoration:const InputDecoration(
                      hintText: 'Typee here....',
                    ),
                    onSubmitted: (value) {
                      todoController.addTodo(value);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () {
                    if (con.value.text.isEmpty) {
                      print('error');
                    }
                     else {
                       todoController.addTodo(con.value.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
