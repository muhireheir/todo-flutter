import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_item/todo_item.dart';

class TodoItems extends StatefulWidget {
  const TodoItems({super.key});

  @override
  State<TodoItems> createState() => _TodoItemsState();
}

class _TodoItemsState extends State<TodoItems> {
  late List<Todo> todoList;
  @override
  void initState() {
    todoList = [
      Todo(
        title: 'Washing dishes',
        dueDate: DateTime.now(),
        bucket: Bucket.home,
        isCompleted: false,
      ),
      Todo(
        title: 'Raise a pull request',
        dueDate: DateTime.now(),
        bucket: Bucket.work,
        isCompleted: true,
      ),
      Todo(
          title: 'DO some  sports',
          dueDate: DateTime.now(),
          bucket: Bucket.others,
          isCompleted: false),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) => TodoListItem(item: todoList[index]),
      ),
    );
  }
}
