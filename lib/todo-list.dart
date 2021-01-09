import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:mytodoapp/todo-add.dart';
import 'package:mytodoapp/todo.dart';

final todoListProvider =
    StateNotifierProvider((ref) => TodoList([Todo("hello")]));

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("リスト一覧"),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          return ListView.builder(
            itemCount: watch(todoListProvider.state).length,
            itemBuilder: (context, index) {
              return Consumer(builder: (context, watch, child) {
                return Card(
                  child: ListTile(
                    title: Text(watch(todoListProvider.state)[index].text),
                  ),
                );
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return TodoAddPage();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
