import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:mytodoapp/todo-list.dart';

final todoTextProvider = StateProvider((ref) => "");

class TodoAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("リスト追加"),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Consumer(
          builder: (context, watch, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(watch(todoTextProvider).state,
                    style: TextStyle(color: Colors.blue)),
                TextField(
                  onChanged: (String value) {
                    context.read(todoTextProvider).state = value;
                  },
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      context
                          .read(todoListProvider)
                          .add(context.read(todoTextProvider).state);
                      Navigator.of(context).pop();
                      context.read(todoTextProvider).state = "";
                    },
                    child: Text(
                      "リスト追加",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.read(todoTextProvider).state = "";
                    },
                    child: Text(
                      "キャンセル",
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
