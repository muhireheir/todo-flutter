import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_item/todo_item.dart';

class TodoItems extends StatelessWidget {
  const TodoItems({super.key, required this.items});
  final List<Todo> items;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => TodoListItem(item: items[index]),
      ),
    );
  }
}
