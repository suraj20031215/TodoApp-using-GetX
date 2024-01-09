import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:myfirstapp/screen/home.dart';

class controller extends GetxController {
  RxList<Todo> todos = <Todo>[].obs;

  void addTodo(String title) {
    todos.add(Todo(title: title));
  }

  void toggleTodoStatus(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
  }

  void removeTodo(int index) {
    todos.removeAt(index);
  }
}
