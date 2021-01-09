import 'package:flutter_riverpod/all.dart';

class Todo {
  Todo(this.text);

  final String text;
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo> initialTodos]) : super(initialTodos ?? []);

  void add(String text) {
    state = [
      ...state,
      Todo(text),
    ];
  }

  String getText(int index) {
    return state[index].text;
  }
}
